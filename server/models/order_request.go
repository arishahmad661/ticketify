package models

type OrderRequest struct {
	Amount   int64  `json:"amount"`
	Currency string `json:"currency"`
}
