package featured_events

import (
	"cloud.google.com/go/firestore"
	"context"
	"errors"
	"fmt"
	"server/config"
	"server/models"
)

func FetchFeaturedEvents(ctx context.Context, client *firestore.Client) (*[]models.FeaturedEventModel, error) {
	rdbClient := config.GetRedisClient()
	redisData, err := FetchFeaturedEventsFromRedis(ctx, rdbClient)
	if err == nil {
		return redisData, nil
	}
	fmt.Printf("\ndidn't send redis data\n")
	collection := client.Collection("featured_events")
	snapshot, err := collection.Documents(ctx).GetAll()
	if err != nil {
		return nil, errors.New("failed to fetch documents")
	}

	var featuredEvents []models.FeaturedEventModel
	for _, doc := range snapshot {
		var event models.FeaturedEventModel
		if err := doc.DataTo(&event); err != nil {
			return nil, errors.New("failed to map documents data")
		}
		featuredEvents = append(featuredEvents, event)
	}

	err = StoreFeaturedEventsInRedis(ctx, rdbClient, &featuredEvents)
	if err != nil {
		return nil, err
	}
	return &featuredEvents, nil
}
