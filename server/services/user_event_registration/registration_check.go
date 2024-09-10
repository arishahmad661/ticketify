package user_event_registration

import (
	"cloud.google.com/go/firestore"
	"context"
	"errors"
	"server/models"
)

func RegistrationCheck(ctx context.Context, client *firestore.Client, deregisterUser models.DeregisterUser) (models.Attendees, error) {
	attendeesCollection := client.Collection("featured_events").Doc(deregisterUser.EventID).Collection("attendees")
	query := attendeesCollection.Where("userID", "==", deregisterUser.UserID).Limit(1)

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
