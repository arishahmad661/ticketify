package user_details

import (
	"cloud.google.com/go/firestore"
	"context"
	"server/config"
	"server/models"
	"server/services/redis"
)

func StoreUserDetails(ctx context.Context, client *firestore.Client, userDetails *models.UserDetails) error {
	err := CheckUserInDatabase(ctx, client, userDetails.UserId)
	if err == nil {
		return nil
	}

	data := map[string]interface{}{
		"email":       userDetails.Email,
		"userID":      userDetails.UserId,
		"displayName": userDetails.DisplayName,
		"phoneNumber": userDetails.PhoneNumber,
		"photoURL":    userDetails.PhotoURL,
	}

	userCollection := client.Collection("users")
	docRef, _, err := userCollection.Add(ctx, data)
	if err != nil {
		return err
	}

	_, err = docRef.Set(ctx, map[string]interface{}{
		"id": docRef.ID,
	}, firestore.MergeAll)
	if err != nil {
		return err
	}

	redisClient := config.GetRedisClient()
	userDetails.Id = docRef.ID

	err = redis.StoreUserDetailsInRedis(ctx, redisClient, userDetails)
	if err != nil {
		return err
	}

	return nil
}
