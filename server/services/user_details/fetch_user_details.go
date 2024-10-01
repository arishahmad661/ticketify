package user_details

import (
	"cloud.google.com/go/firestore"
	"context"
	"errors"
	"server/config"
	"server/models"
	"server/services/redis"
)

func FetchUserDetails(ctx context.Context, client *firestore.Client, userID string) (*models.UserDetails, error) {
	redisClient := config.GetRedisClient()
	redisData, err := redis.FetchUserDetailsInRedis(ctx, redisClient, userID)
	if err == nil {
		return redisData, nil
	}

	collection := client.Collection("users")
	query := collection.Where("userID", "==", userID).Limit(1)
	iter := query.Documents(ctx)

	snapshot, err := iter.Next()
	if err != nil {
		return nil, errors.New("error getting user from database")
	}

	if snapshot == nil {
		return nil, errors.New("error getting user from database")
	}

	var userDetails models.UserDetails
	if err := snapshot.DataTo(&userDetails); err != nil {
		return nil, errors.New("error getting user from database")
	}

	err = redis.StoreUserDetailsInRedis(ctx, redisClient, &userDetails)
	if err != nil {
		return nil, errors.New("error storing user in redis")
	}
	return &userDetails, nil

}
