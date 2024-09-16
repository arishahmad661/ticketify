import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/presentation/screens/explore_screen/widgets/DiscoverEventByDates.dart';
import 'package:ticketify/presentation/screens/explore_screen/widgets/LocationText.dart';
import 'package:ticketify/presentation/screens/explore_screen/widgets/featured_events.dart';
import 'package:ticketify/presentation/widgets/list_tile.dart';
import 'package:ticketify/presentation/widgets/text.dart';
import '../../../blocs/featured_events/events_bloc.dart';
import '../../../blocs/featured_events/events_state.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedEventsBloc, FeaturedEventState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocationText(),
                  const SizedBox(height: 16,),
                  ClipRRect(borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/maps.png")
                  ),
                  const Divider(),
                  Text("Discover events by date", style: textStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 4,),
                  DiscoverEventByDates(),
                  const Divider(),
                  buildListTile(
                    tileTitle: const Text("Find a group you like"),
                    tileSubtitle: const Text("Match your interest with a group"),
                    tileLeading: const Icon(Icons.search),
                    tileTrailing: Image.asset("assets/right-arrow.png"),
                  ),
                  const Divider(),
                  const SizedBox(height: 8,),
                  Text("Explore Ticketify", style: textStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular now", style: textStyle(fontSize: 16.0),),
                      Text("See all", style: textStyle(fontSize: 16.0, color: Colors.blue),),
                    ],
                  ),
                  const SizedBox(height: 4,),

                  const FeaturedEvents(),

                  const Divider(),

                  buildListTile(
                      tileTitle: const Text("Start a new group"),
                      tileSubtitle: const Text("Organise your own events"),
                      tileLeading: Image.asset("assets/right-arrow.png"),
                      tileTrailing: const Icon(Icons.group),
                  ),
                  const Divider(),

                ],
              ),
            ),
          );
        },
      );
  }

}
