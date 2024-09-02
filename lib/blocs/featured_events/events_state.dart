
import 'package:ticketify/data/models/featured_events_model.dart';

sealed class FeaturedEventState {}

final class EventInitial extends FeaturedEventState {}

final class EventLoading extends FeaturedEventState {}

final class EventResponseFailure extends FeaturedEventState {
  final String? e;
  EventResponseFailure({required this.e});
}

final class EventResponseSuccess extends FeaturedEventState {
  final List<FeaturedEventModel> featuredEvents;
  EventResponseSuccess({required this.featuredEvents});
}
