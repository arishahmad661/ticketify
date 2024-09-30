import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import '../../../../blocs/event_registration/event_registration_bloc.dart';
import '../../../../blocs/event_registration/event_registration_event.dart';
import '../../../widgets/text.dart';
import 'date_time_of_event.dart';
import 'event_images.dart';
import 'event_type.dart';
import 'organisers_details.dart';

Widget MainEventScreen(BoxConstraints constraints, BuildContext context, FeaturedEventModel featuredEvent) {
  final formattedFromDate = DateFormat('EEEE, MMMM d, y').format(featuredEvent.fromTime);
  final formattedFromTime = DateFormat('h:mm a').format(featuredEvent.fromTime);
  final formattedToTime = DateFormat('h:mm a').format(featuredEvent.toTime);

  return Padding(
    padding: const EdgeInsets.only(
        right: 8.0, left: 8.0, bottom: 60),
    child: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight - 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: eventImages(
                  imageURL: featuredEvent.mainLogo,
                  context: context),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              textAlign: TextAlign.start,
              featuredEvent.name,
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
                BlocProvider.of<EventRegistrationBloc>(context).add(AddReminderToCalender(featuredEventModel: featuredEvent,
                    lastState: lastState));
              },
              child: DateTimeOfEvent(formattedFromDate, formattedFromTime, formattedToTime),
            ),
            const Divider(),
            EventType(featuredEvent.isOffline, featuredEvent.location),
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
              featuredEvent.description,
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
            organisersDetail(featuredEvent: featuredEvent),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    ),
  );
}
