import 'package:flutter/material.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_screen/widgets/payment.dart';
import 'event_registration_submit_button.dart';

Widget FloatingActionForInitialState(FeaturedEventModel featuredEvent, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text('RSVP Now',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold),
      ),
      featuredEvent.cost != 0
          ? Payment(eventDetails: featuredEvent,)
          : submitButton(featuredEvent, context),
    ],
  );
}
