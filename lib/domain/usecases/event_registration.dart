import 'package:ticketify/domain/repositories/event_registration_repository.dart';

class EventRegistration{
  final EventRegistrationRepository eventRegistrationRepository;
  EventRegistration(this.eventRegistrationRepository);

  Future eventRegistrationCheck(String eventID){
    return eventRegistrationRepository.eventRegistrationCheck(eventID);
  }

  Future eventRegistration(String eventID){
    return eventRegistrationRepository.eventRegistration(eventID);
  }
}