package v1

import (
	"github.com/gin-gonic/gin"
	"server/api/v1/handlers"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()
	api := r.Group("/api/v1")
	{
		api.GET("/featured-events", handlers.GetFeaturedEvents)
		api.POST("/registration-check", handlers.PostRegistrationCheck)
		api.POST("/register-user", handlers.PostRegisterUser)
		api.POST("/create-order", handlers.PostCreateOrder)
		api.POST("/verify-payment", handlers.PostPaymentVerification)
		api.POST("/deregister-user", handlers.PostDeregisterUser)
	}
	return r
}
