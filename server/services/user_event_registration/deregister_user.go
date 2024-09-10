package user_event_registration

import (
	"cloud.google.com/go/firestore"
	"context"
	"errors"
	"server/models"
)

func DeregisterUser(ctx context.Context, client *firestore.Client, attendeesCheck models.AttendeesCheck) error {
	attendeeCollection := client.Collection("featured_events").Doc(attendeesCheck.EventId).Collection("attendees")
	query := attendeeCollection.Where("userID", "==", attendeesCheck.UserId).Limit(1)

	snapshot, err := query.Documents(ctx).GetAll()

	if err != nil {
		return err
	}

	if len(snapshot) == 0 {
		return errors.New("attendee not found")
	}

	if err = snapshot[0].DataTo(&attendeesCheck); err != nil {
		return err
	}

	_, err = snapshot[0].Ref.Delete(ctx)

	if err != nil {
		return err
	}

	return nil
}
