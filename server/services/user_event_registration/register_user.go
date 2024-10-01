package user_event_registration

import (
	"cloud.google.com/go/firestore"
	"context"
	"server/models"
)

func RegisterUser(ctx context.Context, client *firestore.Client, eventRegistration models.EventRegistration) (string, error) {

	data := map[string]interface{}{
		"userEmail":       eventRegistration.Attendee.UserEmail,
		"userID":          eventRegistration.Attendee.UserID,
		"userName":        eventRegistration.Attendee.UserName,
		"isCheckedIn":     eventRegistration.Attendee.IsCheckedIn,
		"userPhoneNumber": eventRegistration.Attendee.UserPhoneNumber,
		"orderId":         eventRegistration.Attendee.OrderId,
		"paymentId":       eventRegistration.Attendee.PaymentId,
	}

	attendeesCollection := client.Collection("featured_events").Doc(eventRegistration.EventID).Collection("attendees")

	docRef, _, err := attendeesCollection.Add(ctx, data)

	if err != nil {
		return "", err
	}

	_, err = docRef.Set(ctx, map[string]interface{}{
		"id": docRef.ID,
	}, firestore.MergeAll)

	if err != nil {
		return "", err
	}

	return docRef.ID, nil
}
