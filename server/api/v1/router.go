package v1

import (
	"github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()
	api := r.Group("/api/v1")
	{
		api.GET("/featured-events", GetFeaturedEvents)
		api.POST("/registration-check", PostRegistrationCheck)
		api.POST("/register-user", PostRegisterUser)
	}
	return r
}
