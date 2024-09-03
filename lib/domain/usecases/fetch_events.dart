import 'package:ticketify/data/models/api_response.dart';
import '../repositories/event_repository.dart';

class FetchEvents {
  final EventRepository repository;

  FetchEvents(this.repository);

  Future<ApiResponse> execute() async {
    return await repository.getEvents();
  }
}
