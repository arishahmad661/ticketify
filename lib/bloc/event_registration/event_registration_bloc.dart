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
    on<RegistratonCheck>(registrationCheck as EventHandler<RegistratonCheck, EventRegistrationState>);
  }
  Future<void> submitRequested(
      SubmitRequested event,
      Emitter<EventRegistrationState> emit,
      ) async {
    emit(LoadingState());
    try {
      Storage storage = Storage();
      String? userID = await storage.fetchUserId();
      if (userID == null) {
        emit(SubmitError(e: 'Try logging out then logging in'));
      }
      AttendeesModel attendeesModel = AttendeesModel(
          userEmail: event.email,
          userId: event.eventID,
          userName: event.name,
          isCheckedIn: false,
          profession: event.profession
      );
      await FirebaseFirestore.instance.collection("events")
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

  registrationCheck(
      RegistratonCheck event,
      Emitter<EventHandler> emit,
      ){

  }
}
