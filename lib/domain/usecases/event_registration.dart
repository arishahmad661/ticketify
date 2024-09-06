import 'package:ticketify/data/models/order_id_request.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';
import 'package:ticketify/domain/repositories/event_registration_repository.dart';

class EventRegistration{
  final EventRegistrationRepository eventRegistrationRepository;
  EventRegistration(this.eventRegistrationRepository);

  Future eventRegistrationCheck(String eventID){
    return eventRegistrationRepository.eventRegistrationCheck(eventID);
  }

  Future eventRegistration(String eventID){
    return eventRegistrationRepository.eventRegistration(eventID);
  }

  Future createOrderID(OrderIDRequest orderIDRequest){
    return eventRegistrationRepository.createOrderID(orderIDRequest);
  }

  Future verifyPayment(PaymentSuccessResponseModel paymentSuccessResponseModel){
    return eventRegistrationRepository.verifyPayment(paymentSuccessResponseModel);
  }
}