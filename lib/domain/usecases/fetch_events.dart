import 'package:ticketify/data/models/featured_events_model.dart';
import '../repositories/event_repository.dart';

class FetchEvents {
  final EventRepository repository;

  FetchEvents(this.repository);

  Future<List<FeaturedEventModel>> execute() async {
    return await repository.getEvents();
  }
}
