import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/attendes_model.dart';
import 'package:ticketify/domain/usecases/event_registration.dart';
import 'package:ticketify/storage/storage_client.dart';
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
      Storage storage = Storage();
      String userID = await storage.fetchUserId();
      String userName = await storage.fetchUserName();
      String userEmail = await storage.fetchUserEmail();
      String userPhoneNumber = await storage.fetchUserPhoneNumber();
      if (userID == "" || userName == "" || userEmail == "" || userPhoneNumber == "") {
        emit(SubmitError(e: 'Try logging out then logging in.'));
      }
      AttendeesModel attendeesModel = AttendeesModel(
          userEmail: userEmail,
          userId: userID,
          userName: userName,
          isCheckedIn: false,
          userPhoneNumber: userPhoneNumber,
      );
      await FirebaseFirestore.instance.collection("featured_events")
          .doc(event.eventID)
          .collection("attendees")
          .add(
          attendeesModel.toJson()
      );
      emit(SubmitSuccessful(qrData: jsonEncode(attendeesModel)));
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
      final ApiResponse data = await eventRegistration.registerUser(event.eventID);
      if(data.code == 404){
        emit(InitialState());
      }else if(data.code == 200){
        emit(CheckSuccessful(qrData: data.data.toString()));
      }
      else {
        emit(SubmitError(e: data.code.toString()));
      }
    }catch(e){
      emit(SubmitError(e: e.toString()));
    }
      }
}
