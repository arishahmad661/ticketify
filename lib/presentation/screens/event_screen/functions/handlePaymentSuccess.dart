import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_state.dart';
import 'package:ticketify/data/models/featured_events_model.dart';

import '../../../../blocs/event_registration/event_registration_event.dart';

void handlePaymentSuccess(EventRegistrationBloc eventBloc, PaymentSuccess state, FeaturedEventModel featuredEvent) {
  eventBloc.add(SubmitRequested(
    eventID: featuredEvent.eventId,
    paymentId: state.paymentId,
    orderID: state.orderId,
  ));
}