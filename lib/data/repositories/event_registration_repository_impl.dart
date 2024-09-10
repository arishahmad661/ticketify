import 'package:ticketify/data/datasources/event_registration_remote_data_source.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/data/models/order_id_request.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';
import 'package:ticketify/domain/repositories/event_registration_repository.dart';

class EventRegistrationImpl implements EventRegistrationRepository {
  final EventRegistrationDataSource eventRegistrationDataSource;

  EventRegistrationImpl(this.eventRegistrationDataSource);


  @override
  Future<ApiResponse> eventRegistrationCheck(String eventID) {
    return eventRegistrationDataSource.eventRegistrationCheck(eventID);
  }

  @override
  Future<ApiResponse> eventRegistration(String eventID, String? orderId, String? paymentId) {
    return eventRegistrationDataSource.eventRegistration(eventID, orderId, paymentId);
  }

  @override
  Future<ApiResponse> createOrderID(OrderIDRequest orderIDRequest) {
    return eventRegistrationDataSource.createOrderID(orderIDRequest);
  }

  @override
  Future<ApiResponse> verifyPayment(
      PaymentSuccessResponseModel paymentSuccessResponseModel) {
    return eventRegistrationDataSource.verifyPayment(
        paymentSuccessResponseModel);
  }

  @override
  Future<ApiResponse> addReminderToCalender(
      FeaturedEventModel featuredEventModel) {
    return eventRegistrationDataSource.addReminderToCalender(featuredEventModel);
  }

  @override
  Future<ApiResponse> deregisterUser(String eventID) {
    return eventRegistrationDataSource.deregisterUser(eventID);
  }



}
