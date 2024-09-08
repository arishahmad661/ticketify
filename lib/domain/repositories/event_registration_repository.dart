import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/order_id_request.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';

abstract class EventRegistrationRepository{
  Future<ApiResponse> eventRegistrationCheck(String eventID);
  Future<ApiResponse> eventRegistration(String eventID, String? orderId, String? paymentId);
  Future<ApiResponse> createOrderID(OrderIDRequest orderIDRequest);
  Future<ApiResponse> verifyPayment(PaymentSuccessResponseModel paymentSuccessResponseModel);
}