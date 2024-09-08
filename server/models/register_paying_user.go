package models

type RegisterPayingUser struct {
	EventID   string    `json:"eventId"`
	OrderID   string    `json:"orderId"`
	PaymentID string    `json:"paymentId"`
	Attendee  Attendees `json:"attendee"`
}
