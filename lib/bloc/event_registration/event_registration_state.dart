sealed class EventRegistrationState {}

class InitialState extends EventRegistrationState {}

class LoadingState extends EventRegistrationState {}

final class SubmitError extends EventRegistrationState {
  String e;
  SubmitError({required this.e});
}

final class SubmitSuccessful extends EventRegistrationState {
  String qrData;
  SubmitSuccessful({required this.qrData});
}