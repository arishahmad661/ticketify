import 'package:ticketify/data/models/attendes_model.dart';
import 'package:ticketify/data/models/response_order_id.dart';

sealed class EventRegistrationState {}

class InitialState extends EventRegistrationState {}

class LoadingState extends EventRegistrationState {}

class FullPageLoadingState extends EventRegistrationState {}

final class SubmitError extends EventRegistrationState {
  String e;
  SubmitError({required this.e});
}

final class SubmitSuccessful extends EventRegistrationState {
  AttendeesModel attendeesModel;
  SubmitSuccessful({required this.attendeesModel});
}

final class CheckSuccessful extends EventRegistrationState {
  AttendeesModel attendeesModel;
  CheckSuccessful({required this.attendeesModel});
}

final class ResponseOrderID extends EventRegistrationState {
  ResponseOrderIDModel responseOrderID;
  ResponseOrderID({required this.responseOrderID});
}

final class PaymentSuccess extends EventRegistrationState{
  final String? orderId;
  final String? paymentId;
  PaymentSuccess({required this.orderId, required this.paymentId});
}

final class PaymentError extends EventRegistrationState{

}

final class ExternalWallet extends EventRegistrationState{

}

final class ReminderToCalenderAdded extends EventRegistrationState{

}

final class ReminderToCalenderFailed extends EventRegistrationState{

}


