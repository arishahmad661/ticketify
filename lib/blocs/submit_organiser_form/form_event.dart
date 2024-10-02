import '../../data/models/featured_events_model.dart';

sealed class SubmitOrganiserFormEvent {}

final class SubmissionRequest extends SubmitOrganiserFormEvent{
  final FeaturedEventModel featuredEventModel;
  SubmissionRequest(this.featuredEventModel);
}