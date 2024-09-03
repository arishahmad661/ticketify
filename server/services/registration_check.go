package services

import (
	"cloud.google.com/go/firestore"
	"context"
	"errors"
	"server/models"
)

func RegistrationCheck(ctx context.Context, client *firestore.Client, attendeesCheck models.AttendeesCheck) (models.Attendees, error) {
	attendeesCollection := client.Collection("featured_events").Doc(attendeesCheck.EventId).Collection("attendees")
	query := attendeesCollection.Where("userID", "==", attendeesCheck.UserId).Limit(1)

	snapshot, err := query.Documents(ctx).GetAll()
	var attendees models.Attendees

	if err != nil {
		return attendees, err
	}
	if len(snapshot) == 0 {
		return attendees, errors.New("attendee not found")
	}
	if err := snapshot[0].DataTo(&attendees); err != nil {
		return attendees, err
	}
	return attendees, nil
}
