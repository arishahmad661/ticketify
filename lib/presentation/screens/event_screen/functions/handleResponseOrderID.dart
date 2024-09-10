import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import '../../../../blocs/event_registration/event_registration_event.dart';
import '../../../../blocs/event_registration/event_registration_state.dart';

void handleResponseOrderID(EventRegistrationBloc eventBloc, ResponseOrderID state) {
  eventBloc.add(InitializeRazorpay(
    amount: state.responseOrderID.message!.amount,
    orderID: state.responseOrderID.message!.id,
  ));
}