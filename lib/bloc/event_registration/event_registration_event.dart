sealed class EventRegistrationEvent {}

final class SubmitRequested extends EventRegistrationEvent {
  final String eventID;
  SubmitRequested({
    required this.eventID,
});
}

final class RegistrationCheck extends EventRegistrationEvent {
  String eventID;
  RegistrationCheck({required this.eventID});
}




