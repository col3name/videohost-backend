package controller

import (
	"github.com/bearname/videohost/pkg/common/amqp"
	"github.com/bearname/videohost/pkg/common/infrarstructure/transport/controller"
	"github.com/bearname/videohost/pkg/common/util"
	"github.com/bearname/videohost/pkg/videoserver/domain/model"
	"github.com/bearname/videohost/pkg/videoserver/domain/repository"
	"github.com/bearname/videohost/pkg/videoserver/infrastructure/ftp"
	"github.com/google/uuid"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"path/filepath"
)

type VideoController struct {
	controller.BaseController
	videoRepository repository.VideoRepository
	messageBroker   amqp.MessageBroker
}

func NewVideoController(videoRepository repository.VideoRepository) *VideoController {
	v := new(VideoController)

	v.videoRepository = videoRepository
	v.messageBroker = amqp.NewRabbitMqService("guest", "guest", "localhost", 5672)
	if v.messageBroker == nil {
		return nil
	}
	return v
}

func (c VideoController) GetVideo() func(w http.ResponseWriter, r *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer = *c.BaseController.AllowCorsRequest(&writer)
		if (*request).Method == "OPTIONS" {
			writer.WriteHeader(http.StatusNoContent)
			return
		}
		vars := mux.Vars(request)
		var id string
		var ok bool

		if id, ok = vars["ID"]; !ok {
			http.Error(writer, "404 video not found not found", http.StatusNotFound)
			return
		}

		video, err := c.videoRepository.GetVideo(id)
		if err != nil {
			log.Error(err.Error())
			http.Error(writer, err.Error(), http.StatusInternalServerError)
			return
		}

		c.WriteResponseData(writer, video)
	}
}

func (c VideoController) GetVideoList() func(http.ResponseWriter, *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer = *c.BaseController.AllowCorsRequest(&writer)
		if (*request).Method == "OPTIONS" {
			writer.WriteHeader(http.StatusNoContent)
			return
		}
		var page int
		page, success := c.GetIntRouteParameter(writer, request, "page")
		if !success {
			return
		}
		var countVideoOnPage int
		countVideoOnPage, success = c.GetIntRouteParameter(writer, request, "countVideoOnPage")
		if !success {
			return
		}

		log.Info("page ", page, " count video ", countVideoOnPage)
		pageCount, ok := c.videoRepository.GetPageCount(countVideoOnPage)
		if !ok {
			http.Error(writer, "Failed get page countVideoOnPage", http.StatusInternalServerError)
			return
		}

		videos, err := c.videoRepository.GetVideoList(page, countVideoOnPage)
		if err != nil {
			log.Error(err.Error())
			http.Error(writer, err.Error(), http.StatusInternalServerError)
			return
		}

		responseData := make(map[string]interface{})
		responseData["pageCount"] = pageCount
		responseData["videos"] = videos

		c.WriteResponseData(writer, responseData)
	}
}

func (c VideoController) UploadVideo() func(http.ResponseWriter, *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.Header().Set("Access-Control-Allow-Origin", "*")
		writer.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		writer.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
		if (*request).Method == "OPTIONS" {
			writer.WriteHeader(http.StatusNoContent)
			return
		}

		authorization := request.Header.Get("Authorization")
		userId, ok := util.ValidateToken(authorization, "http://localhost:8001")
		if !ok {
			http.Error(writer, "Not grant permission", http.StatusUnauthorized)
			return
		}

		title := request.FormValue("title")
		description := request.FormValue("description")
		fileReader, header, err := request.FormFile("file")

		if err != nil {
			log.Error(err.Error())
			http.Error(writer, err.Error(), http.StatusBadRequest)
			return
		}

		contentType := header.Header.Get("Content-Type")
		if contentType != util.VideoContentType {
			log.Error("Unexpected content type", contentType)
			http.Error(writer, "Unexpected content type", http.StatusBadRequest)
			return
		}

		id, err := uuid.NewUUID()
		if err != nil {
			log.Error(err.Error())
			http.Error(writer, err.Error(), http.StatusBadRequest)
			return
		}
		videoId := id.String()
		go func() {
			connection := ftp.NewFtpConnection("localhost:21", "user", "123")
			err = connection.CopyFile(videoId, fileReader)
			//	err = util.CopyFile(fileReader, videoId)
			if err != nil {
				log.Error(err.Error())
				http.Error(writer, err.Error(), http.StatusBadRequest)
				return
			}
		}()

		err = c.videoRepository.NewVideo(
			userId,
			videoId,
			title,
			description,
			filepath.Join(util.ContentDir, videoId, util.VideoFileName),
		)
		if err != nil {
			log.Error(err.Error())
			http.Error(writer, err.Error(), http.StatusBadRequest)
			return
		}

		//output, err := cmdExec(`ffprobe`, `-v`, `error`, `-select_streams`, `v:0`, `-show_entries`, `stream=width,height`, `-of`, `csv=s=x:p=0`, util.VideoFileName)
		//log.Info("resolution of file " + util.VideoFileName + " equal " + output)
		//c.messageBroker.Publish("events_topic", "events.upload-video", id.String())

		writer.WriteHeader(http.StatusOK)
		c.BaseController.JsonResponse(writer, id)
	}
}

func (c *VideoController) SearchVideo() func(http.ResponseWriter, *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer = *c.BaseController.AllowCorsRequest(&writer)
		if (*request).Method == "OPTIONS" {
			writer.WriteHeader(http.StatusNoContent)
			return
		}

		var page int
		page, success := c.GetIntRouteParameter(writer, request, "page")
		if !success {
			http.Error(writer, "page parameter not present", http.StatusInternalServerError)
			return
		}
		var countVideoOnPage int
		countVideoOnPage, success = c.GetIntRouteParameter(writer, request, "limit")
		if !success {
			http.Error(writer, "limit parameter not present", http.StatusInternalServerError)
			return
		}
		var search string
		search, success = c.ParseRouteParameter(request, "search")
		if !success {
			http.Error(writer, "countVideoOnPage parameter not present", http.StatusInternalServerError)
			return
		}

		log.Info("page ", page, " count video ", countVideoOnPage)
		pageCount, ok := c.videoRepository.GetPageCount(countVideoOnPage)
		if !ok {
			http.Error(writer, "Failed get page countVideoOnPage", http.StatusInternalServerError)
			return
		}

		videos, err := c.videoRepository.SearchVideo(search, page, countVideoOnPage)
		if err != nil {
			log.Error(err.Error())
			http.Error(writer, err.Error(), http.StatusInternalServerError)
			return
		}

		c.responseVideoListItems(writer, pageCount, videos)
	}
}

func (c *VideoController) IncrementViews() func(http.ResponseWriter, *http.Request) {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer = *c.BaseController.AllowCorsRequest(&writer)
		if (*request).Method == "OPTIONS" {
			writer.WriteHeader(http.StatusNoContent)
			return
		}
		vars := mux.Vars(request)
		var id string
		var ok bool

		if id, ok = vars["id"]; !ok {
			http.Error(writer, "404 video not found not found", http.StatusNotFound)
			return
		}

		responseData := make(map[string]interface{})
		responseData["success"] = c.videoRepository.IncrementViews(id)

		c.JsonResponse(writer, responseData)
	}
}

func (c *VideoController) responseVideoListItems(writer http.ResponseWriter, pageCount int, videos []model.VideoListItem) {
	responseData := make(map[string]interface{})
	responseData["pageCount"] = pageCount
	responseData["videos"] = videos

	c.WriteResponseData(writer, responseData)
}
