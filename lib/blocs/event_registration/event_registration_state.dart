import 'package:ticketify/data/models/response_order_id.dart';

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
