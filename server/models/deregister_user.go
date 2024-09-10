package models

type DeregisterUser struct {
	EventID string `json:"eventId"`
	UserID  string `json:"userId"`
}
