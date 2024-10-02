import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/featured_events_model.dart';

abstract class EventRepository {
  Future<ApiResponse> fetchFeaturedEvents();
  Future<ApiResponse> storeEvents(FeaturedEventModel featuredEventModel);
}
