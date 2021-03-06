package model

type Video struct {
	Id            string    `json:"id"`
	Name          string    `json:"name"`
	Description   string    `json:"description"`
	Duration      int       `json:"duration"`
	OwnerId       string    `json:"ownerId"`
	Thumbnail     string    `json:"thumbnail"`
	Status        int       `json:"status"`
	Url           string    `json:"url"`
	Uploaded      string    `json:"uploaded"`
	Quality       string    `json:"quality"`
	Views         int       `json:"views"`
	Chapters      []Chapter `json:"chapters"`
	CountLikes    int       `json:"countLikes"`
	CountDisLikes int       `json:"countDisLikes"`
}
