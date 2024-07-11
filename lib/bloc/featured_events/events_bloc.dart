import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/bloc/featured_events/events_event.dart';
import 'package:ticketify/bloc/featured_events/events_state.dart';
import 'package:ticketify/models/featured_events_model.dart';

class FeaturedEventsBloc extends Bloc<FeaturedsEventsEvent, FeaturedEventState>{
  FeaturedEventsBloc(): super(EventInitial()){
    on<EventRequested>(fetchFeaturedEvents);
  }
  Future fetchFeaturedEvents(
      EventRequested event,
      Emitter<FeaturedEventState> emit,
      ) async {
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    try{
      emit(EventLoading());
      final QuerySnapshot snapshot = await _firebaseFirestore.collection('featured_events').get();
      final List<FeaturedEventModel> featuredEvents = snapshot.docs.map((e) => FeaturedEventModel.fromJson(e)).toList().reversed.toList();
      return emit(EventResponseSuccess(featuredEvents: featuredEvents));
    }catch(e){
      print(e);
      return emit(EventResponseFailure(e: e.toString()));
    }
  }
}