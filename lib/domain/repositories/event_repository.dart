import 'package:ticketify/data/models/api_response.dart';

abstract class EventRepository {
  Future<ApiResponse> getEvents();
}
