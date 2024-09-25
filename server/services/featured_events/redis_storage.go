package featured_events

import (
	"context"
	"encoding/json"
	"errors"
	"github.com/redis/go-redis/v9"
	"server/models"
	"time"
)

var RedisFeaturedEventsKey = "explore_page:featured_event"

func StoreFeaturedEventsInRedis(ctx context.Context, rdb *redis.Client, events *[]models.FeaturedEventModel) error {
	// Convert the FeaturedEventModel to JSON
	eventJSON, err := json.Marshal(&events)
	if err != nil {
		return err
	}

	// Store the serialized event JSON in Redis with a key
	err = rdb.Set(ctx, RedisFeaturedEventsKey, eventJSON, time.Hour*24).Err()
	if err != nil {
		return err
	}
	return nil
}

func FetchFeaturedEventsFromRedis(ctx context.Context, rdb *redis.Client) (*[]models.FeaturedEventModel, error) {
	// Get the data from redis
	redisData, err := rdb.Get(ctx, RedisFeaturedEventsKey).Result()
	if err != nil {
		// Check if the redis data is empty
		if errors.Is(err, redis.Nil) {
			return nil, errors.New("redis data is nil")
		}
	}

	var featuredEvents []models.FeaturedEventModel
	// Convert redis data to model
	err = json.Unmarshal([]byte(redisData), &featuredEvents)
	if err != nil {
		return nil, err
	}
	return &featuredEvents, err
}
