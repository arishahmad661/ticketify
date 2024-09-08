package handlers

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/models"
	"server/services/payment"
	"server/services/user_event_registration"
	"server/utils"
)

func PostRegisterUser(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()

	var eventRegistration models.EventRegistration

	if err := c.BindJSON(&eventRegistration); err != nil {
		utils.HandleError(c, http.StatusBadRequest, err)
		return
	}

	err := user_event_registration.RegisterUser(ctx, client, eventRegistration)

	if err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
	}
	c.IndentedJSON(http.StatusOK, eventRegistration.Attendee)
}

func PostRegisterPayingUser(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()

	var registerPayingUser models.RegisterPayingUser

	if err := c.BindJSON(&registerPayingUser); err != nil {
		utils.HandleError(c, http.StatusBadRequest, err)
		return
	}

	err := payment.RegisterPayingUser(ctx, client, registerPayingUser)

	if err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
	}
	c.IndentedJSON(http.StatusOK, registerPayingUser.Attendee)
}
