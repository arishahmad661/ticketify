import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import '../repositories/event_repository.dart';

class FetchEvents {
  final EventRepository repository;

  FetchEvents(this.repository);

  Future<ApiResponse> fetchFeaturedEvents() async {
    return await repository.fetchFeaturedEvents();
  }

  Future<ApiResponse> storeEvents(FeaturedEventModel featuredEventModel) async {
    print("domain usecase");
    return await repository.storeEvents(featuredEventModel);
  }
}
