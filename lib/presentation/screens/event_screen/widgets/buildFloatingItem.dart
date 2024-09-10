import 'package:flutter/material.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_screen/widgets/floating_action_for_initial_state.dart';
import 'package:ticketify/presentation/screens/event_screen/widgets/registration_button.dart';
import '../../../../blocs/event_registration/event_registration_event.dart';
import '../../../../blocs/event_registration/event_registration_state.dart';
import '../../../widgets/loading_indicator.dart';

Widget buildFloatingTicketItem(EventRegistrationState state, FeaturedEventModel featuredEvent, BuildContext context, EventRegistrationBloc eventBloc) {

  if (state is InitialState || state is PaymentError){
    return FloatingActionForInitialState(featuredEvent, context);
  }

  else if (state is CheckSuccessful) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You\'re coming',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap:(){
                eventBloc.add(DeregisterUser(eventId: featuredEvent.eventId));
              },
              child: const Text(
                'Edit your RSVP',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        buildDownloadTicketButton(
            context: context,
            attendeesModel: state.attendeesModel,
            eventDetails: featuredEvent),
      ],
    );
  }

  else if (state is SubmitError) {
    return Center(child: Text(state.e));
  }

  else if(state is LoadingState || state is PaymentSuccess || state is SubmitSuccessful || state is CreateOrderID || state is InitializeRazorpay || state is ResponseOrderID){
    return buildLoadingIndicator();
  }

  return FloatingActionForInitialState(featuredEvent, context);
}
