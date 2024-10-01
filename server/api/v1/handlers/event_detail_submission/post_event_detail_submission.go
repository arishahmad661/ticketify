package event_detail_submission

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"server/services/event_detail_submission"
	"server/utils"
)

func PostEventDetailSubmission(c *gin.Context) {
	err := event_detail_submission.StoreEventDetails()
	if err != nil {
		utils.HandleError(c, http.StatusInternalServerError, err)
	}
	c.IndentedJSON(http.StatusOK, gin.H{"message": "new event stored successfully"})
}
