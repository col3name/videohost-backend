package domain

import (
	commonDto "github.com/bearname/videohost/pkg/common/dto"
	dto2 "github.com/bearname/videohost/pkg/videoserver/domain/dto"
	"github.com/bearname/videohost/pkg/videoserver/domain/model"
	"github.com/google/uuid"
	"net/http"
)

type StreamService interface {
	ServeHlsM3u8(w http.ResponseWriter, r *http.Request, videoId string, m3u8Name string)
	ServeHlsTs(w http.ResponseWriter, r *http.Request, segName, videoId string)
}

type VideoService interface {
	FindVideo(videoId string) (*model.Video, error)
	UploadVideo(userId string, videoDto *dto2.UploadVideoDto) (uuid.UUID, error)
	UpdateTitleAndDescription(userDto commonDto.UserDto, videoId string, videoDto dto2.VideoMetadata) error
	AddQuality(videoId string, userDto commonDto.UserDto, quality model.Quality) error
	DeleteVideo(userDto commonDto.UserDto, videoId string) error
	FindVideoOnPage(searchDto *dto2.SearchDto) (dto2.SearchResultDto, error)
	LikeVideo(like model.Like) (model.Action, error)
}
