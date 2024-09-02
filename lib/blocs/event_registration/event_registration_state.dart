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

final class CheckSuccessful extends EventRegistrationState {
  String qrData;
  CheckSuccessful({required this.qrData});
}
