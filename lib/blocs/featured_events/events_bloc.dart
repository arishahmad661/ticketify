import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/domain/usecases/fetch_events.dart';
import 'events_event.dart';
import 'events_state.dart';

class FeaturedEventsBloc extends Bloc<FeaturedsEventsEvent, FeaturedEventState>{
  final FetchEvents fetchEvents;
  FeaturedEventsBloc({required this.fetchEvents}): super(EventInitial()){
    on<EventRequested>(fetchFeaturedEvents);
  }
  Future fetchFeaturedEvents(
      EventRequested event,
      Emitter<FeaturedEventState> emit,
      ) async {
    // FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    try{
      emit(EventLoading());
      final List<FeaturedEventModel> eventModelList = await fetchEvents.execute();
      return emit(EventResponseSuccess(featuredEvents: eventModelList));

      // final QuerySnapshot snapshot = await _firebaseFirestore.collection('featured_events').get();
      // final List<FeaturedEventModel> featuredEvents = snapshot.docs.map((e) => FeaturedEventModel.fromJson(e)).toList().reversed.toList();
      // return emit(EventResponseSuccess(featuredEvents: featuredEvents));
    }catch(e){
      print(e);
      return emit(EventResponseFailure(e: e.toString()));
    }
  }
}