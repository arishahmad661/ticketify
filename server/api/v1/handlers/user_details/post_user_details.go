package user_details

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/models"
	"server/services/user_details"
	"server/utils"
)

func PostStoreUserDetails(c *gin.Context) {
	ctx := context.Background()
	var userDetails models.UserDetails
	if err := c.ShouldBindJSON(&userDetails); err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
	}
	client := config.GetFirestoreClient()

	err := user_details.StoreUserDetails(ctx, client, &userDetails)
	if err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
	}
	c.IndentedJSON(http.StatusOK, gin.H{"message": "user information stored successfully"})
}
