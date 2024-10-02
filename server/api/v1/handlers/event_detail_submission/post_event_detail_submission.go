package event_detail_submission

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/models"
	"server/services/event_detail_submission"
	"server/utils"
)

func PostStoreEvents(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()
	var featuredEvents models.FeaturedEventModel

	if err := c.ShouldBindJSON(&featuredEvents); err != nil {
		utils.HandleError(c, http.StatusUnprocessableEntity, err)
		return
	}

	_, err := event_detail_submission.StoreEventDetails(ctx, client, &featuredEvents)
	if err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
		return
	}
	c.IndentedJSON(http.StatusOK, gin.H{"message": "new event stored successfully"})
}
