import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/data/models/api_response.dart';
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
    try{
      emit(EventLoading());
      final ApiResponse apiResponse = await fetchEvents.execute();
      if (apiResponse.code == 200){
        return emit(EventResponseSuccess(featuredEvents: apiResponse.data));
      }else{
        return emit(EventResponseFailure(e: apiResponse.error));
      }
    }catch(e){
      return emit(EventResponseFailure(e: e.toString()));
    }
  }
}