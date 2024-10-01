package user_details

import (
	"cloud.google.com/go/firestore"
	"context"
	"errors"
)

func CheckUserInDatabase(ctx context.Context, client *firestore.Client, userID string) error {
	collection := client.Collection("users")
	query := collection.Where("userID", "==", userID).Limit(1)
	iter := query.Documents(ctx)

	snapshot, err := iter.Next()
	if err != nil {
		return errors.New("Error getting user from database")
	}

	if snapshot == nil {
		return errors.New("Error getting user from database")
	}
	return nil
}
