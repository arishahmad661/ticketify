import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/domain/repositories/event_repository.dart';
import '../datasources/event_remote_data_source.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> fetchFeaturedEvents() async {
    final eventModelList = await remoteDataSource.fetchEvents();
    return eventModelList;
  }

  @override
  Future<ApiResponse> storeEvents(FeaturedEventModel featuredEventModel) async {
    final response = await remoteDataSource.storeEvents(featuredEventModel);
    return response;
  }
}
