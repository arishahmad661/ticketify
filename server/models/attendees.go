package models

type Attendees struct {
	UserEmail       string `json:"userEmail"`
	UserID          string `json:"userID"`
	UserName        string `json:"userName"`
	IsCheckedIn     bool   `json:"isCheckedIn"`
	UserPhoneNumber string `json:"userPhoneNumber"`
}