package models

type EventRegistration struct {
	EventID  string    `json:"eventId"`
	Attendee Attendees `json:"attendee"`
}
