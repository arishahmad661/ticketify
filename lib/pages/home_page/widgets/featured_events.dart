import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/bloc/featured_events/events_bloc.dart';
import 'package:ticketify/bloc/featured_events/events_event.dart';
import 'package:ticketify/bloc/featured_events/events_state.dart';
import '../../../models/featured_events_model.dart';
import 'display_featured_event_card.dart';


class FeaturedEvents extends StatefulWidget {
  const FeaturedEvents({super.key});

  @override
  State<FeaturedEvents> createState() => _FeaturedEventsState();
}

class _FeaturedEventsState extends State<FeaturedEvents> {
  late List<FeaturedEventModel> featuredEvents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FeaturedEventsBloc>().add(EventRequested());
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FeaturedEventsBloc, FeaturedEventState>(
        listener: (context, state) {
          if(state is EventResponseSuccess){
            featuredEvents = state.featuredEvents;
          }
        },
        builder: (context, state) {
          if (state is EventResponseSuccess) {
            return Column(
              children: [
                const Text("Featured Events",style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 87, 33, 72),),),
                const SizedBox(height: 8,),
                SizedBox(
                  height: 335,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: featuredEvents.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return displayEventCard(
                        featuredEvent:featuredEvents[index],
                        context: context
                      );
                    },
                  ),
                ),
              ],
            );
          } else if(state is EventLoading || state is EventInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else{
            return Container();
          }
        }
    );
  }
}

