sealed class EventRegistrationEvent {}

final class SubmitRequested extends EventRegistrationEvent {
  final String eventID, email, name, profession;
  SubmitRequested({
    required this.eventID,
    required this.email,
    required this.name,
    required this.profession
});
}

final class RegistratonCheck extends EventRegistrationEvent {}




