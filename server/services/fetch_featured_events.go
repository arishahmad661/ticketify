package services

import (
	"cloud.google.com/go/firestore"
	"context"
	"fmt"
	"server/models"
)

func FetchFeaturedEvents(ctx context.Context, client *firestore.Client) ([]models.FeaturedEventModel, error) {
	collection := client.Collection("featured_events")
	snapshot, err := collection.Documents(ctx).GetAll()
	if err != nil {
		return nil, fmt.Errorf("failed to fetch documents: %w", err)
	}

	var featuredEvents []models.FeaturedEventModel
	for _, doc := range snapshot {
		var event models.FeaturedEventModel
		if err := doc.DataTo(&event); err != nil {
			return nil, fmt.Errorf("failed to map document data: %w", err)
		}
		featuredEvents = append(featuredEvents, event)
	}

	return featuredEvents, nil
}
