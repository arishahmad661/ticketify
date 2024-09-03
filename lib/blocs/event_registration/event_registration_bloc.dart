import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/domain/usecases/event_registration.dart';
import 'event_registration_state.dart';

class EventRegistrationBloc extends Bloc<EventRegistrationEvent, EventRegistrationState>{
  final EventRegistration eventRegistration;
  EventRegistrationBloc({required this.eventRegistration}): super(InitialState()){
    on<SubmitRequested>(submitRequested);
    on<RegistrationCheck>(registrationCheck);
  }
  Future<void> submitRequested(
      SubmitRequested event,
      Emitter<EventRegistrationState> emit,
      ) async {
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

  Future<void> registrationCheck(
      RegistrationCheck event,
      Emitter<EventRegistrationState> emit,
      )async {
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
}
