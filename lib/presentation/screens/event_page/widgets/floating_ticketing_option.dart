import 'package:flutter/material.dart';
import 'package:ticketify/blocs/event_registration/event_registration_state.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_page/widgets/registration_button.dart';
import 'floating_action_for_initial_state.dart';

Widget FloatingTicketingOption(EventRegistrationState state, BuildContext context, FeaturedEventModel featuredEvent) {
  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      child: Column(
        children: [
          if (state is InitialState || state is PaymentError) FloatingActionForInitialState(featuredEvent, context)
          else if (state is CheckSuccessful) Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You\'re coming',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Edit your RSVP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                buildDownloadTicketButton(
                    context: context,
                    qrData: state.qrData,
                    eventDetails: featuredEvent),
              ],
            )
          else if (state is SubmitError) Center(child: Text(state.e))
            else if(state is LoadingState) Center(child: CircularProgressIndicator(),)
            else FloatingActionForInitialState(featuredEvent, context)
        ],
      ),
    ),
  );
}

