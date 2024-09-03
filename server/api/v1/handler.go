package v1

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/models"
	"server/services"
	"server/utils"
)

func GetFeaturedEvents(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()

	events, err := services.FetchFeaturedEvents(ctx, client)
	if nil != err {
		utils.HandleError(c, http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusOK, events)
}

func PostRegistrationCheck(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()
	var attendeesCheck models.AttendeesCheck

	if err := c.BindJSON(&attendeesCheck); err != nil {
		c.IndentedJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	}

	events, err := services.RegistrationCheck(ctx, client, attendeesCheck)
	if err != nil {
		if err.Error() == "Attendee not found" {
			utils.HandleError(c, http.StatusNotFound, err)
			return
		}
		utils.HandleError(c, http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusOK, events)
}
