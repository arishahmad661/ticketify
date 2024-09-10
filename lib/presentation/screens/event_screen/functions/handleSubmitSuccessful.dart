import 'package:flutter/material.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import '../../../../blocs/event_registration/event_registration_event.dart';
import '../../../../blocs/event_registration/event_registration_state.dart';
import '../../ticket_screen/ticket_page.dart';

void handleSubmitSuccessful(BuildContext context, EventRegistrationBloc eventBloc, SubmitSuccessful state, FeaturedEventModel featuredEvent) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketPage(
        attendeesModel: state.attendeesModel,
        featuredEventModel: featuredEvent,
      ),
    ),
  );
  if (result == true) {
    eventBloc.add(RegistrationCheck(eventID: featuredEvent.eventId));
  }
}