package handlers

import (
	"errors"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/models"
	"server/services/payment"
	"server/utils"
)

func PostCreateOrder(c *gin.Context) {
	var request models.OrderRequest

	if err := c.ShouldBindJSON(&request); err != nil {
		utils.HandleError(c, http.StatusBadRequest, errors.New("invalid request payload"))
		return
	}

	orderDetails, err := payment.CreateOrder(request)
	if err != nil {
		utils.HandleError(c, 400, err)
		return
	}
	c.JSON(200, gin.H{"message": orderDetails})
}

func PostPaymentVerification(c *gin.Context) {
	var verifyPayment models.VerifyPayment

	if err := c.ShouldBindJSON(&verifyPayment); err != nil {
		utils.HandleError(c, http.StatusBadRequest, errors.New("invalid request payload"))
	}
	err := payment.VerifyPayment(verifyPayment)

	if err != nil {
		utils.HandleError(c, http.StatusBadRequest, err)
		return
	}
	c.IndentedJSON(http.StatusOK, gin.H{"message": "success"})
}
