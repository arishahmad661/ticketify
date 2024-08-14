import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/bloc/event_registration/event_registration_event.dart';
import 'package:ticketify/bloc/event_registration/event_registration_state.dart';
import 'package:ticketify/models/attendes_model.dart';
import 'package:ticketify/storage/storage_client.dart';

class EventRegistrationBloc extends Bloc<EventRegistrationEvent, EventRegistrationState>{
  EventRegistrationBloc(): super(InitialState()){
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
      Storage storage = Storage();
      String? userID = await storage.fetchUserId();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("featured_events")
          .doc(event.eventID)
          .collection("attendees")
          .where('userID', isEqualTo: userID)
          .limit(1)
          .get();
      print(querySnapshot.docs.isEmpty);
      if(querySnapshot.docs.isEmpty){
        emit(InitialState());
      }
      else emit(CheckSuccessful(qrData: jsonEncode(AttendeesModel.fromJson(querySnapshot.docs[0]))));
    }catch(e){
      emit(SubmitError(e: e.toString()));
      print(e);
    }
      }
}
