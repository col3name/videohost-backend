package subscriber

import (
	"encoding/json"
	"fmt"
	"github.com/bearname/videohost/internal/common/caching"
	"github.com/bearname/videohost/internal/common/db"
	"github.com/bearname/videohost/internal/common/util"
	"github.com/bearname/videohost/internal/thumbgenerator/domain/model"
	videoModel "github.com/bearname/videohost/internal/videoserver/domain/model"
	log "github.com/sirupsen/logrus"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"
)

func HandleTask(task *model.Task, connector db.Connector, cache caching.Cache) {
	url := task.Url
	thumbUrl := filepath.Join(filepath.Dir(url), util.ThumbFileName)
	log.Info("HandleTask" + task.Id + task.Url)
	fmt.Println("HandleTask" + task.Id + task.Url)
	outputHlsDirectory := url[0 : strings.LastIndex(url, "\\")+1]
	url = strings.ReplaceAll(url, "\\", "\\")
	root := "C:\\Users\\mikha\\go\\src\\videohost\\bin\\videoserver\\"
	url = root + strings.ReplaceAll(url, "\\", "\\")
	outputHlsDirectory = root + strings.ReplaceAll(outputHlsDirectory, "\\", "\\")
	name := "C:\\Users\\mikha\\go\\src\\videohost\\bin\\videoprocessor\\videoprocessor.exe"
	inputVideoFilePath := root + strings.ReplaceAll(thumbUrl, "\\", "\\")
	out, err := exec.Command(name, url, inputVideoFilePath, outputHlsDirectory).Output()
	if err != nil {
		log.Error(err.Error())
		return
	}

	duration, err := strconv.ParseFloat(string(out), 64)
	if err != nil {
		log.Error(err.Error())
		return
	}

	query := "UPDATE video SET status=?, duration=?, thumbnail_url=? WHERE id_video=?;"
	err = connector.ExecTransaction(
		query,
		model.Processed,
		duration,
		thumbUrl,
		task.Id,
	)
	if err != nil {
		log.Error("Failed set status processed" + err.Error())
	}

	var video videoModel.Video
	query = "SELECT id_video, title, description, duration, thumbnail_url, url, uploaded, quality, views, owner_id, status FROM video WHERE id_video=?;"
	row := connector.GetDb().QueryRow(query, task.Id)

	err = row.Scan(
		&video.Id,
		&video.Name,
		&video.Description,
		&video.Duration,
		&video.Thumbnail,
		&video.Url,
		&video.Uploaded,
		&video.Quality,
		&video.Views,
		&video.OwnerId,
		&video.Status,
	)
	if err == nil {
		var marshal []byte
		marshal, err = json.Marshal(video)
		if err == nil {
			err = cache.Set("video-"+task.Id, string(marshal))
			if err != nil {
				log.Error("Failed update cache" + err.Error())
			}
		}
	}
}
