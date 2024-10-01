package featured_events

import (
	"context"
	"github.com/gin-gonic/gin"
	"net/http"
	"server/config"
	"server/services/featured_events"
	"server/utils"
)

func GetFeaturedEvents(c *gin.Context) {
	ctx := context.Background()
	client := config.GetFirestoreClient()

	events, err := featured_events.FetchFeaturedEvents(ctx, client)
	if nil != err {
		utils.HandleError(c, http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusOK, *events)
}
