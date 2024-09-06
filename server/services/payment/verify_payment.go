package payment

import (
	"errors"
	"github.com/razorpay/razorpay-go/utils"
	"os"
	"server/models"
)

func checkSignatureIntegrity(orderId, paymentId, signature, apiSecret string) bool {
	params := map[string]interface{}{
		"razorpay_order_id":   orderId,
		"razorpay_payment_id": paymentId,
	}
	ok := utils.VerifyPaymentSignature(params, signature, apiSecret)
	return ok
}

func VerifyPayment(verifyPayment models.VerifyPayment) error {
	apiSecret := os.Getenv("RAZORPAY_API_SECRET")

	isValid := checkSignatureIntegrity(verifyPayment.OrderID, verifyPayment.PaymentID, verifyPayment.Signature, apiSecret)

	if isValid {
		return nil
	} else {
		return errors.New("signature verification failed")
	}
}
