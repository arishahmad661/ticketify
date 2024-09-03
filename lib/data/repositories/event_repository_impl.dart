import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/domain/repositories/event_repository.dart';
import '../datasources/event_remote_data_source.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> getEvents() async {
    final eventModelList = await remoteDataSource.fetchEvents();
    return eventModelList;
  }
}
