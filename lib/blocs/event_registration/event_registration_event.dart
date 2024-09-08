import 'package:ticketify/data/models/order_id_request.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';

sealed class EventRegistrationEvent {}

final class SubmitRequested extends EventRegistrationEvent {
  final String eventID;
  final String? orderID;
  final String? paymentId;
  SubmitRequested({
    required this.eventID,
    this.paymentId,
    this.orderID
});
}

final class RegistrationCheck extends EventRegistrationEvent {
  String eventID;
  RegistrationCheck({required this.eventID});
}

final class CreateOrderID extends EventRegistrationEvent {
  final OrderIDRequest orderIDRequest;
  CreateOrderID({required this.orderIDRequest});
}


final class InitializeRazorpay extends EventRegistrationEvent {
  final int amount;
  final String orderID;
  InitializeRazorpay({required this.amount, required this.orderID});
}

final class PaymentSuccessEvent extends EventRegistrationEvent {
  final PaymentSuccessResponseModel response;
  PaymentSuccessEvent({required this.response});
}

final class PaymentErrorEvent extends EventRegistrationEvent {
  final response;
  PaymentErrorEvent({required this.response});
}

final class PaymentExternalWallet extends EventRegistrationEvent {
  final response;
  PaymentExternalWallet({required this.response});
}





