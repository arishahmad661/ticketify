import 'package:ticketify/data/models/featured_events_model.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_data_source.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FeaturedEventModel>> getEvents() async {
    final eventModelList = await remoteDataSource.fetchEvents();
    return eventModelList;
  }
}
