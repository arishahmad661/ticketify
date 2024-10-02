# Ticketify

## Overview

Ticketify is an event management application designed to streamline the process of event scheduling, registration, and payments. Built with **Flutter** for the frontend and **Go** for the backend, this app provides a smooth user experience and robust performance.

## Technologies Used

- **Frontend**: Flutter, Bloc
- **Backend**: Go, Gin
- **Database**: Firebase
- **Caching**: Redis (running in Docker)
- **Deployment**: AWS EC2
- **Payment Processing**: Razorpay
- **API Integration**: Google Calendar API

## Features

- **Automated Event Scheduling**: Integration with Google Calendar API for seamless event management.
- **Secure Payments**: Razorpay integration for safe and easy payment processing.
- **Real-Time Data**: Utilizes Firebase for real-time database management and authentication.
- **Scalable Architecture**: Backend services deployed on AWS EC2 for reliability and scalability.
- **Optimized Performance**: Implemented Redis for caching and efficient data management.

## Getting Started

To get a local copy up and running, follow these steps:

### Prerequisites

- Flutter
- Go
- Docker (for running Redis)

### Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/arishahmad661/ticketify
2. Navigate to the project directory:
   ```bash
   cd ticketify
3. Install Flutter dependencies:
   ```bash
   flutter pub get
4. Set up the Go backend:
   ```bash
   cd server
   go mod tidy
5. Run Redis in Docker:
   Make sure Docker is installed and running. Then execute:
   ```bash
   docker run --name ticketify-redis -d -p 6379:6379 redis
6. Configure environment variables for Firebase and Razorpay.
7. Run the application:
   1. Start the backend server:
      ```bash
      go run main.go
    2. Launch the Flutter app:
       ```bash
       flutter run

## Contributing

Contributions are welcome! If you'd like to contribute to Ticketify, please follow these steps:
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/YourFeature
3. Make your changes and commit them:
   ```bash
   git commit -m "Add your feature"
4. Push to the branch:
   ```bash
   git push origin feature/YourFeature
5. Open a pull request.
