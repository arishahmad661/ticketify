package handlers

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/models"
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

	docID, err := user_event_registration.RegisterUser(ctx, client, eventRegistration)

	if err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
	}
	eventRegistration.Attendee.Id = docID
	c.IndentedJSON(http.StatusOK, eventRegistration.Attendee)
}
