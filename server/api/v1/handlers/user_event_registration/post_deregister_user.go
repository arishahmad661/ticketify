package user_event_registration

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/models"
	"server/services/user_event_registration"
	"server/utils"
)

func PostDeregisterUser(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()

	var attendeesCheck models.AttendeesCheck
	if err := c.BindJSON(&attendeesCheck); err != nil {
		c.IndentedJSON(http.StatusBadRequest, gin.H{"error": err})
	}

	err := user_event_registration.DeregisterUser(ctx, client, attendeesCheck)
	if err != nil {
		if err.Error() == "attendee not found" {
			utils.HandleError(c, http.StatusNotFound, err)
			return
		}
		utils.HandleError(c, http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "User successfully deregistered"})
}
