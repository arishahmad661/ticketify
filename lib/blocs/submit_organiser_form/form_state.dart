import 'package:ticketify/data/models/featured_events_model.dart';

sealed class SubmitOrganiserFormState {
}

final class SubmissionInitial extends SubmitOrganiserFormState {}

final class SubmissionLoading extends SubmitOrganiserFormState {}

final class SubmissionFailed extends SubmitOrganiserFormState {
  final String e;
  SubmissionFailed({required this.e});
}

final class SubmissionSuccess extends SubmitOrganiserFormState {}
