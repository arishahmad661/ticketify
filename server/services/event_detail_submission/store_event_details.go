package event_detail_submission

import (
	"cloud.google.com/go/firestore"
	"context"
	"server/models"
)

// TODO: implement fromTime, toTime, and registrationDeadline in frontend

func StoreEventDetails(ctx context.Context, client *firestore.Client, featuredEventModel *models.FeaturedEventModel) (string, error) {
	data := map[string]interface{}{
		"eventId":               featuredEventModel.EventId,
		"cost":                  featuredEventModel.Cost,
		"description":           featuredEventModel.Description,
		"fromTime":              featuredEventModel.FromTime,
		"toTime":                featuredEventModel.ToTime,
		"registrationDeadline":  featuredEventModel.RegistrationDeadline,
		"isOffline":             featuredEventModel.IsOffline,
		"location":              featuredEventModel.Location,
		"mainLogo":              featuredEventModel.MainLogo,
		"name":                  featuredEventModel.Name,
		"organisersName":        featuredEventModel.OrganisersName,
		"organisersMainLogo":    featuredEventModel.OrganisersMainLogo,
		"organiserDescription":  featuredEventModel.OrganiserDescription,
		"organiserEmail":        featuredEventModel.OrganiserEmail,
		"organiserMobileNumber": featuredEventModel.OrganiserMobileNumber,
		"organiserLocation":     featuredEventModel.OrganiserLocation,
	}
	collection := client.Collection("featured_events")

	docRef, _, err := collection.Add(ctx, data)
	if err != nil {
		return "", err
	}

	_, err = docRef.Set(ctx, map[string]interface{}{
		"eventId": docRef.ID,
	}, firestore.MergeAll)

	if err != nil {
		return "", err
	}
	return docRef.ID, nil
}
