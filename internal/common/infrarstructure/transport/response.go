package transport

type Response struct {
	Success bool   `json:"success"`
	Message string `json:"message"`
}
