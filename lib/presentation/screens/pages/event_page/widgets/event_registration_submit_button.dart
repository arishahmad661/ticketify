import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/data/models/featured_events_model.dart';

Widget submitButton(FeaturedEventModel eventDetails, BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 253, 177, 75)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))),
          minimumSize: MaterialStateProperty.all(const Size(160, 50)),
        ),
        onPressed: () {
          BlocProvider.of<EventRegistrationBloc>(context).add(
              SubmitRequested(eventID: eventDetails.eventId)
          );
        },
        child: const Text("Register", style: TextStyle(
            color: Color.fromARGB(255, 87, 33, 72), fontSize: 16),)
    );
  }