package util

import (
	log "github.com/sirupsen/logrus"
	"io"
	"net/http"
)

func GetRequest(client *http.Client, url string, authorization string) ([]byte, error) {
	request, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, err
	}

	if len(authorization) != 0 {
		request.Header.Add("Authorization", authorization)
	}
	response, err := client.Do(request)
	if err != nil {
		log.Error(err.Error())
		return nil, err
	}
	defer response.Body.Close()

	if response.StatusCode == http.StatusUnauthorized {
		return nil, err
	}

	return io.ReadAll(response.Body)
}
