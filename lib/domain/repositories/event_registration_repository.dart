import 'package:ticketify/data/models/api_response.dart';

abstract class EventRegistrationRepository{
  Future<ApiResponse> eventRegistrationCheck(String eventID);
  Future<ApiResponse> eventRegistration(String eventID);
}