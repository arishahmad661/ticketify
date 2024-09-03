import 'package:ticketify/data/datasources/event_registration_remote_data_source.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/domain/repositories/event_registration_repository.dart';

class EventRegistrationImpl implements EventRegistrationRepository{
  final EventRegistrationDataSource eventRegistrationDataSource;
  EventRegistrationImpl(this.eventRegistrationDataSource);


  @override
  Future<ApiResponse> eventRegistration(String eventID) {
    return eventRegistrationDataSource.registerUser(eventID);
  }}