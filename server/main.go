package main

import (
	"context"
	"github.com/joho/godotenv"
	"log"
	"os"
	v1 "server/api/v1"
	"server/config"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
		return
	}

	ctx := context.Background()
	firebaseSecret := os.Getenv("FIREBASE_SECRET")
	firebaseProjectID := os.Getenv("FIREBASE_PROJECT_ID")
	address := "localhost:6379"

	_, err = config.InitializeFirestore(ctx, firebaseSecret, firebaseProjectID)
	if err != nil {
		log.Fatalf("Failed to initialize Firestore client: %v", err)
		return
	}
	defer config.GetFirestoreClient().Close()

	_ = config.InitializeRedis(address)
	defer config.GetRedisClient().Close()

	r := v1.SetupRouter()
	// Network Access: If you are running the app on an emulator or physical device, localhost might refer to the emulator or device itself. For an emulator, use http://10.0.2.2 instead of localhost to access your local server.
	// Connectivity: Ensure that your device or emulator has internet access and can reach the server.
	// On your computer, open a terminal or command prompt and use the following command to find your local IP address:
	// Windows: ipconfig
	// Look for the “IPv4 Address” under your active network connection.
	// Make sure your server is bound to all network interfaces, not just localhost. You may need to modify the binding address in your server configuration to 0.0.0.0 or your local IP address.
	if err := r.Run(":8080"); err != nil {
		log.Fatalf("Failed to start server: %v", err)
		return
	}
}
