import 'package:ticketify/data/models/api_response.dart';

abstract class EventRegistrationRepository{
  Future<ApiResponse> eventRegistration(String eventID);
}