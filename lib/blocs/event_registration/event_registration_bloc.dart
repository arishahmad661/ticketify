import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';
import 'package:ticketify/domain/usecases/event_registration.dart';
import '../../data/models/response_order_id.dart';
import 'event_registration_state.dart';

class EventRegistrationBloc extends Bloc<EventRegistrationEvent, EventRegistrationState>{
  late Razorpay _razorpay;
  final EventRegistration eventRegistration;
  EventRegistrationBloc({required this.eventRegistration}): super(InitialState()){
    on<SubmitRequested>(submitRequested);
    on<RegistrationCheck>(registrationCheck);
    on<CreateOrderID>(createOrderID);
    on<InitializeRazorpay>(initializeRazorpay);
    on<PaymentSuccessEvent>(handlePaymentSuccess);
    on<PaymentErrorEvent>(handlePaymentError);
    on<PaymentExternalWallet>(handleExternalWallet);
  }

  Future<void> submitRequested(SubmitRequested event, Emitter<EventRegistrationState> emit,) async {
    emit(LoadingState());
    try {
      final ApiResponse data = await eventRegistration.eventRegistration(event.eventID);
      if(data.code == 200){
        emit(SubmitSuccessful(qrData: jsonEncode(data.data)));
      }else{
          emit(SubmitError(e: data.error.toString()));
      }
    }catch(e){
      emit(SubmitError(e: e.toString()));
    }
  }

  Future<void> registrationCheck(RegistrationCheck event, Emitter<EventRegistrationState> emit,)async {
    emit(LoadingState());
    try{
      if (event.eventID.isEmpty || event.eventID == ""){
        emit(SubmitError(e: "Event id not found."));
      }
      final ApiResponse data = await eventRegistration.eventRegistrationCheck(event.eventID);
      if(data.code == 200){
        emit(CheckSuccessful(qrData: data.data.toString()));
      } else if(data.code == 404){
        emit(InitialState());
      }else {
        emit(SubmitError(e: data.code.toString()));
      }
    }catch(e){
      emit(SubmitError(e: e.toString()));
    }
  }

  Future<void> createOrderID(CreateOrderID event, Emitter<EventRegistrationState> emit) async {
    emit(LoadingState());
    try{
      final ApiResponse data = await eventRegistration.createOrderID(event.orderIDRequest);
      final ResponseOrderIDModel response = ResponseOrderIDModel.fromJson(jsonDecode(data.data));
      if(data.code == 200){
        return emit(ResponseOrderID(responseOrderID: response));
      } else if(data.code == 404){
        emit(InitialState());
      }else {
        emit(SubmitError(e: data.code.toString()));
      }
    }catch(e){
      emit(SubmitError(e: e.toString()));
    }
  }

  Future<void> initializeRazorpay(InitializeRazorpay event, Emitter<EventRegistrationState> emit) async {
      _razorpay = Razorpay();

      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse response) {
        _razorpay.clear();
        PaymentSuccessResponseModel paymentResponse = PaymentSuccessResponseModel(
          paymentId: response.paymentId,
          orderId: response.orderId,
          signature: response.signature,
        );
        add(PaymentSuccessEvent(response: paymentResponse));
      });
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse response) {
        _razorpay.clear();
        add(PaymentErrorEvent(response : response));
      });
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (response) {
        _razorpay.clear();
        print("External Wallet Event Triggered");
        add(PaymentExternalWallet(response: response));
      });

      var options = <String, dynamic>{
        'key': dotenv.env['RAZORPAY_API_KEY'],
        'order_id': event.orderID,
        'amount': event.amount * 100,
        'name': 'Ticketify',
        'description': 'Payment for event ticket.',
        'prefill': {
          'contact': '+as asasasasas',
          'email': 'asas@ticketify.as'
        },
        'external': {
          'wallets': ['paytm']
        },
        'theme': {
          'color': '#F37254'
        },
      };

      try {
        print("Opening Razorpay with options: $options");
        _razorpay.open(options);
      } catch (e) {
        print("Error opening Razorpay: $e");
      }
  }

  Future<void> handlePaymentSuccess(PaymentSuccessEvent event, Emitter<EventRegistrationState> emit) async {

    final PaymentSuccessResponseModel paymentSuccessResponseModel = event.response;
    final ApiResponse response = await eventRegistration.eventRegistrationRepository.verifyPayment(paymentSuccessResponseModel);

    if(response.code == 200){
      emit(PaymentSuccess());
    }else{
      add(PaymentErrorEvent(response: response));
    }

  }

  Future<void> handlePaymentError(PaymentErrorEvent event, Emitter<EventRegistrationState> emit) async {
    print("Payment Error: ${event.response}");
    emit(PaymentError());
  }

  Future<void> handleExternalWallet(PaymentExternalWallet event, Emitter<EventRegistrationState> emit) async {
    print("Payment External Wallet: ${event.response}");
    emit(ExternalWallet());
  }
}


