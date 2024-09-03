package config

import (
	"cloud.google.com/go/firestore"
	"context"
	"google.golang.org/api/option"
	"log"
	"sync"
)

var (
	client *firestore.Client
	once   sync.Once
)

func InitializeFirestore(ctx context.Context, credentialsFile, projectID string) (*firestore.Client, error) {
	var err error
	once.Do(func() {
		client, err = firestore.NewClient(ctx, projectID, option.WithCredentialsFile(credentialsFile))
		if err != nil {
			log.Fatalf("Failed to create Firestore client: %v", err)
		}
	})
	return client, err
}

func GetFirestoreClient() *firestore.Client {
	return client
}
