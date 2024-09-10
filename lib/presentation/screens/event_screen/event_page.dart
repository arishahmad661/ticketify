import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/blocs/event_registration/event_registration_state.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_screen/widgets/buildEventScreenBody.dart';
import 'functions/handlePaymentSuccess.dart';
import 'functions/handleResponseOrderID.dart';
import 'functions/handleSubmitSuccessful.dart';
import 'functions/showReminderDialog.dart';

class EventScreen extends StatefulWidget {
  final FeaturedEventModel featuredEvent;
  const EventScreen({super.key, required this.featuredEvent});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventRegistrationBloc>(context).add(RegistrationCheck(eventID: widget.featuredEvent.eventId));
  }

  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventRegistrationBloc>(context);

    return BlocConsumer<EventRegistrationBloc, EventRegistrationState>(
        listener: (context, state) async {
          if (state is SubmitSuccessful) {
            handleSubmitSuccessful(context, eventBloc, state, widget.featuredEvent);
          }
          if (state is ResponseOrderID) {
            handleResponseOrderID(eventBloc, state);
          }
          if (state is PaymentSuccess) {
            handlePaymentSuccess(eventBloc, state, widget.featuredEvent);
          }
          if (state is ReminderToCalenderAdded) {
            showInfoDialog(context, "Reminder set", "Google calender will notify you about the event.");
          }
          if (state is ReminderToCalenderFailed) {
            showInfoDialog(context, "Reminder setting failed.", "Can not add the reminder.");
          }
          if (state is PaymentError) {
            showInfoDialog(context, "Payment Error", "Payment was not completed. If you think this is an error contact support team.");
          }
          },

        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Event"),
            ),
            body: buildEventScreenBody(eventBloc, context, state, widget.featuredEvent),
          );
        }
        );
  }
}

