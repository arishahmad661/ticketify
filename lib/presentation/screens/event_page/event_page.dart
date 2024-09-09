import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/blocs/event_registration/event_registration_state.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_page/widgets/date_time_of_event.dart';
import 'package:ticketify/presentation/screens/event_page/widgets/event_images.dart';
import 'package:ticketify/presentation/screens/event_page/widgets/event_type.dart';
import 'package:ticketify/presentation/screens/event_page/widgets/floating_ticketing_option.dart';
import 'package:ticketify/presentation/screens/event_page/widgets/organisers_details.dart';
import 'package:ticketify/presentation/widgets/text.dart';
import '../ticket_page/ticket_page.dart';

class EventPage extends StatefulWidget {
  FeaturedEventModel featuredEvent;
  EventPage({super.key, required this.featuredEvent});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventRegistrationBloc>(context)
        .add(RegistrationCheck(eventID: widget.featuredEvent.eventId));
  }

  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventRegistrationBloc>(context);
    final formattedFromDate =
        DateFormat('EEEE, MMMM d, y').format(widget.featuredEvent.fromTime);
    final formattedFromTime =
        DateFormat('h:mm a').format(widget.featuredEvent.fromTime);
    final formattedToTime =
        DateFormat('h:mm a').format(widget.featuredEvent.toTime);

    return BlocConsumer<EventRegistrationBloc, EventRegistrationState>(
        listener: (context, state) async {
      if (state is SubmitSuccessful) {
        final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TicketPage(
                qrData: state.qrData,
                featuredEventModel: widget.featuredEvent,
              ),
            ));
        if (result == true) {
          eventBloc.add(RegistrationCheck(eventID: widget.featuredEvent.eventId));
        }
      }
      if (state is ResponseOrderID) {
        eventBloc.add(InitializeRazorpay(
            amount: state.responseOrderID.message!.amount,
            orderID: state.responseOrderID.message!.id));
      }
      if (state is PaymentSuccess) {
        eventBloc.add(SubmitRequested(
            eventID: widget.featuredEvent.eventId,
            paymentId: state.paymentId,
            orderID: state.orderId));
      }
      if (state is ReminderToCalenderAdded) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Reminder set"),
              content: const Text(
                  "Google calender will notify you about the event."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            );
          },
        );
      }
      if (state is ReminderToCalenderFailed) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Reminder setting failed."),
              content: const Text("Can not add the reminder."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            );
          },
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Event"),
        ),
        body: state is FullPageLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, left: 8.0, bottom: 60),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: eventImages(
                                imageURL: widget.featuredEvent.images,
                                context: context),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            widget.featuredEvent.name,
                            style: textStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              final lastState = BlocProvider.of<EventRegistrationBloc>(context).state;
                              BlocProvider.of<EventRegistrationBloc>(context).add(AddReminderToCalender(featuredEventModel: widget.featuredEvent,
                                  lastState: lastState));
                            },
                            child: DateTimeOfEvent(formattedFromDate, formattedFromTime, formattedToTime),
                          ),
                          const Divider(),
                          EventType(widget.featuredEvent.isOffline, widget.featuredEvent.location),
                          const Divider(),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "About the Event",
                            style: textStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ReadMoreText(
                            widget.featuredEvent.description,
                            trimMode: TrimMode.Line,
                            trimLines: 3,
                            colorClickableText: Colors.blue,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Organisers",
                            style: textStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          organisersDetail(featuredEvent: widget.featuredEvent),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FloatingTicketingOption(state, context, widget.featuredEvent),
                ],
              ),
      );
    });
  }
}
