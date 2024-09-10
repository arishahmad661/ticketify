import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/data/models/order_id_request.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';
import 'package:ticketify/domain/repositories/event_registration_repository.dart';

class EventRegistration{
  final EventRegistrationRepository eventRegistrationRepository;
  EventRegistration(this.eventRegistrationRepository);

  Future eventRegistrationCheck(String eventID){
    return eventRegistrationRepository.eventRegistrationCheck(eventID);
  }

  Future eventRegistration(String eventID, String? orderId, String? paymentId){
    return eventRegistrationRepository.eventRegistration(eventID, orderId, paymentId);
  }

  Future createOrderID(OrderIDRequest orderIDRequest){
    return eventRegistrationRepository.createOrderID(orderIDRequest);
  }

  Future verifyPayment(PaymentSuccessResponseModel paymentSuccessResponseModel){
    return eventRegistrationRepository.verifyPayment(paymentSuccessResponseModel);
  }

  Future addReminderToCalender(FeaturedEventModel featuredEventModel){
    return eventRegistrationRepository.addReminderToCalender(featuredEventModel);
  }

  Future deregisterUser(String eventID){
    return eventRegistrationRepository.deregisterUser(eventID);
  }

}