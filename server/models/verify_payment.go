package models

type VerifyPayment struct {
	OrderID   string `json:"orderId"`
	PaymentID string `json:"paymentId"`
	Signature string `json:"signature"`
}
