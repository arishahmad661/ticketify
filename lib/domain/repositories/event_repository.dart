import '../../data/models/featured_events_model.dart';

abstract class EventRepository {
  Future<List<FeaturedEventModel>> getEvents();
}
