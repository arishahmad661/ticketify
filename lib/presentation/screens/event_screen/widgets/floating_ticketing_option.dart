import 'package:flutter/material.dart';
import 'package:ticketify/blocs/event_registration/event_registration_state.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_screen/widgets/buildFloatingItem.dart';
import '../../../../blocs/event_registration/event_registration_bloc.dart';

Widget FloatingTicketingOption(EventRegistrationBloc eventBloc,EventRegistrationState state, BuildContext context, FeaturedEventModel featuredEvent) {
  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    child: Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildFloatingTicketItem(state, featuredEvent, context, eventBloc),
      ),
    ),
  );
}


