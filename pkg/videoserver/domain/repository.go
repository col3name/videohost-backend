package domain

import (
	dto2 "github.com/bearname/videohost/pkg/videoserver/domain/dto"
	"github.com/bearname/videohost/pkg/videoserver/domain/model"
)

type VideoRepository interface {
	Create(userId string, videoId string, title string, description string, url string, chapters []dto2.ChapterDto) error
	Save(video *model.Video) error
	Find(videoId string) (*model.Video, error)
	FindVideosByPage(page int, count int) ([]model.VideoListItem, error)
	FindUserVideos(userId string, dto dto2.SearchDto) ([]model.VideoListItem, error)
	Update(videoId string, title string, description string) error
	Delete(videoId string) error
	GetPageCount(countVideoOnPage int) (int, bool)
	AddVideoQuality(videoId string, quality string) error
	IncrementViews(videoId string) bool
	SearchVideo(searchString string, page int, count int) ([]model.VideoListItem, error)
	Like(like model.Like) (model.Action, error)
	DeleteLike(like model.Like) error
}
