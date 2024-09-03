package models

import "time"

type FeaturedEventModel struct {
	EventId              string    `json:"eventId"`
	Cost                 int       `json:"cost"`
	Description          string    `json:"description"`
	FromTime             time.Time `json:"fromTime"`
	ToTime               time.Time `json:"toTime"`
	RegistrationDeadline time.Time `json:"registrationDeadline"`
	IsOffline            bool      `json:"isOffline"`
	Images               []string  `json:"images"`
	Location             string    `json:"location"`
	MainLogo             string    `json:"mainLogo"`
	Name                 string    `json:"name"`
	OrganisersName       []string  `json:"organisersName"`
	OrganisersPic        []string  `json:"organisersPic"`
	OrganiserDescription []string  `json:"organiserDescription"`
}
