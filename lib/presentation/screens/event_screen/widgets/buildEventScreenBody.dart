import 'package:flutter/material.dart';
import 'package:ticketify/blocs/event_registration/event_registration_state.dart';
import '../../../../data/models/featured_events_model.dart';
import '../../../widgets/loading_indicator.dart';
import 'event_page.dart';

Widget buildEventScreenBody(BuildContext context, EventRegistrationState state, FeaturedEventModel featuredEvent) {
  if (state is FullPageLoadingState) {
    return buildLoadingIndicator();
  } else {
    return EventPage(state, context, featuredEvent);
  }
}
