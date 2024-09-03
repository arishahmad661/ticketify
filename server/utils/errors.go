package utils

import (
	"github.com/gin-gonic/gin"
)

func HandleError(c *gin.Context, status int, err error) {
	c.IndentedJSON(status, gin.H{"error": err.Error()})
}
