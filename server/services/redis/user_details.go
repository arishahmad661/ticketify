package redis

import (
	"context"
	"encoding/json"
	"errors"
	"github.com/redis/go-redis/v9"
	"server/models"
)

var RedisUserDetailKey = "userDetails:"

func StoreUserDetailsInRedis(ctx context.Context, rdb *redis.Client, userDetails *models.UserDetails) error {
	JSON, err := json.Marshal(userDetails)
	if err != nil {
		return err
	}
	RedisUserDetailKey += userDetails.UserId
	err = rdb.Set(ctx, RedisUserDetailKey, JSON, 0).Err()
	if err != nil {
		return err
	}
	return nil
}

func FetchUserDetailsInRedis(ctx context.Context, rdb *redis.Client, userId string) (*models.UserDetails, error) {

	RedisUserDetailKey += userId
	redisData, err := rdb.Get(ctx, RedisUserDetailKey).Result()
	if err != nil {
		if errors.Is(err, redis.Nil) {
			return nil, errors.New("redis data is nil")
		}
	}

	var userDetails models.UserDetails
	err = json.Unmarshal([]byte(redisData), &userDetails)
	if err != nil {
		return nil, err
	}
	return &userDetails, nil
}
