package payment

import (
	"github.com/google/uuid"
	"github.com/joho/godotenv"
	"github.com/razorpay/razorpay-go"
	"os"
	"server/models"
	"strings"
)

func generateReceiptID() string {
	// Short prefix
	prefix := "rcpt_"
	uuidPart := strings.Replace(uuid.New().String(), "-", "", -1) // Remove hyphens
	receiptID := prefix + uuidPart

	// Ensure it doesn't exceed 40 characters
	if len(receiptID) > 40 {
		return receiptID[:40]
	}
	return receiptID
}

func CreateOrder(request models.OrderRequest) (map[string]interface{}, error) {

	err := godotenv.Load(".env")
	if err != nil {
		return nil, err
	}
	apiKey := os.Getenv("RAZORPAY_API_KEY")
	apiSecret := os.Getenv("RAZORPAY_API_SECRET")
	receiptID := generateReceiptID()

	razorpayClient := razorpay.NewClient(apiKey, apiSecret)
	body, err := razorpayClient.Order.Create(
		map[string]interface{}{
			"amount":   request.Amount * 100,
			"currency": request.Currency,
			"receipt":  receiptID,
		},
		nil,
	)
	if err != nil {
		return nil, err
	}
	return body, err
}
