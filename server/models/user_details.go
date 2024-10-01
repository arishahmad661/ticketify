package models

type UserDetails struct {
	UserId      string `json:"userID"`
	DisplayName string `json:"displayName"`
	Email       string `json:"email"`
	PhotoURL    string `json:"photoURL"`
	PhoneNumber string `json:"phoneNumber"`
	Id          string `json:"id"`
}
