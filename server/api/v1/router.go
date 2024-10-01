package v1

import (
	"github.com/gin-gonic/gin"
	"server/api/v1/handlers/event_detail_submission"
	"server/api/v1/handlers/featured_events"
	"server/api/v1/handlers/payment"
	"server/api/v1/handlers/user_details"
	"server/api/v1/handlers/user_event_registration"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()
	api := r.Group("/api/v1")
	{
		api.POST("/store-user-details", user_details.PostStoreUserDetails)
		api.GET("/featured-events", featured_events.GetFeaturedEvents)
		api.POST("/registration-check", user_event_registration.PostRegistrationCheck)
		api.POST("/register-user", user_event_registration.PostRegisterUser)
		api.POST("/create-order", payment.PostCreateOrder)
		api.POST("/verify-payment", payment.PostPaymentVerification)
		api.POST("/deregister-user", user_event_registration.PostDeregisterUser)
		api.POST("/event-detail-submission", event_detail_submission.PostEventDetailSubmission)
	}
	return r
}
