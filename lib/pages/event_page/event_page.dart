import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ticketify/bloc/event_registration/event_registration_bloc.dart';
import 'package:ticketify/bloc/event_registration/event_registration_event.dart';
import 'package:ticketify/bloc/event_registration/event_registration_state.dart';
import 'package:ticketify/pages/event_page/widgets/dateAndTime.dart';
import 'package:ticketify/pages/event_page/widgets/event_location.dart';
import 'package:ticketify/pages/event_page/widgets/online_medium.dart';
import 'package:ticketify/pages/event_page/widgets/organisers_details.dart';
import 'package:ticketify/pages/event_page/widgets/event_images.dart';
import 'package:ticketify/pages/event_page/widgets/registration_button.dart';
import 'package:ticketify/pages/event_page/widgets/ticket.dart';
import 'package:ticketify/common/widgets/text.dart';
import 'package:ticketify/models/featured_events_model.dart';
import '../../common/widgets/app_bar.dart';
import 'widgets/event_registration_widget.dart';

class EventPage extends StatefulWidget {
  FeaturedEventModel featuredEvent;
  EventPage({super.key, required this.featuredEvent});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String formatDateWithSuffix(DateTime date) {
    var day = DateFormat('d').format(date);
    String suffix = 'th';

    if (day.endsWith('1') && !day.endsWith('11')) {
      suffix = 'st';
    } else if (day.endsWith('2') && !day.endsWith('12')) {
      suffix = 'nd';
    } else if (day.endsWith('3') && !day.endsWith('13')) {
      suffix = 'rd';
    }

    return DateFormat("d'$suffix' MMM yyyy").format(date);
  }

  String formatTime(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }

  String formatDateTime(DateTime dateTime) {
    String datePart = formatDateWithSuffix(dateTime);
    String timePart = formatTime(dateTime);
    return "$datePart, $timePart IST";
  }

  void showEventRegistrationSheet(BuildContext context, String eventID) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (context) =>
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom, // Adjust for keyboard
            ),
            child: SingleChildScrollView(child: EventRegistrationWidget(
                eventID: eventID, eventDetails: widget.featuredEvent)),
          ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<EventRegistrationBloc>(context).add(RegistratonCheck());
  }
  @override
  Widget build(BuildContext context) {
    final formattedFromDateTime = formatDateTime(widget.featuredEvent.fromTime);
    final formattedToDateTime = formatDateTime(widget.featuredEvent.toTime);
    final registrationDeadlineDateTime = formatDateTime(widget.featuredEvent.registrationDeadline);

    return BlocConsumer<EventRegistrationBloc, EventRegistrationState>(
      listener: (context, state) {
      },
      builder: (context, state){
        return Scaffold(
          appBar: buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8,),
                  Text(
                    textAlign: TextAlign.center,
                    widget.featuredEvent.name,
                    style: textStyle(
                        color: const Color.fromARGB(255, 87, 33, 72),
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0),),
                  const SizedBox(height: 16,),
                  dateAndTime(formattedFromDateTime, formattedToDateTime),
                  const SizedBox(height: 16,),
                  if (widget.featuredEvent.isOffline) eventLocation(
                    location: widget.featuredEvent.location,)
                  else
                    onlineMedium(),
                  const SizedBox(height: 24,),
                  registerButton(
                    context: context,
                    eventID: widget.featuredEvent.eventId,
                    onRegister: (BuildContext context, String eventID) {
                      showEventRegistrationSheet(context, eventID);
                    },
                  ),
                  const SizedBox(height: 24,),
                  Align(
                      alignment: Alignment.center,
                      child: eventImages(
                          imageURL: widget.featuredEvent.images, context: context)),
                  const SizedBox(height: 24,),
                  Text("About the Event", style: textStyle(fontSize: 32.0,
                      color: const Color.fromARGB(255, 87, 33, 72),
                      fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8,),
                  Text(widget.featuredEvent.description,
                    style: textStyle(fontSize: 16.0),),
                  const SizedBox(height: 24,),
                  Text("Ticket", style: textStyle(fontSize: 32.0,
                      color: const Color.fromARGB(255, 87, 33, 72),
                      fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8,),
                  ticket(
                    desc: "Available Till: $registrationDeadlineDateTime",
                    title: widget.featuredEvent.name,
                    context: context,
                    eventID: widget.featuredEvent.eventId,
                    onRegister: (BuildContext context, String eventID) {
                      showEventRegistrationSheet(context, eventID);
                    },
                  ),
                  const SizedBox(height: 24,),
                  Text("About the Organisers", style: textStyle(fontSize: 32.0,
                      color: const Color.fromARGB(255, 87, 33, 72),
                      fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8,),
                  organisersDetail(featuredEvent: widget.featuredEvent),
                  const SizedBox(height: 8,),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
