import 'package:flutter/material.dart';
import '../../../../blocs/event_registration/event_registration_bloc.dart';
import '../../../../blocs/event_registration/event_registration_state.dart';
import '../../../../data/models/featured_events_model.dart';
import 'floating_ticketing_option.dart';
import 'main_event_screen.dart';

Widget EventPage(EventRegistrationBloc eventBloc, EventRegistrationState state, BuildContext context, FeaturedEventModel featuredEvent) {
  return LayoutBuilder( builder: (context, constraints) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        MainEventScreen(constraints, context, featuredEvent),
        FloatingTicketingOption(eventBloc, state, context, featuredEvent),
      ],
    );
  },
  );
}
