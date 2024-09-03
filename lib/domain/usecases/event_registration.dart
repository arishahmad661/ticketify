import 'package:ticketify/domain/repositories/event_registration_repository.dart';

class EventRegistration{
  final EventRegistrationRepository eventRegistrationRepository;
  EventRegistration(this.eventRegistrationRepository);

  Future registerUser(String eventID){
    return eventRegistrationRepository.eventRegistration(eventID);
  }
}