import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/submit_organiser_form/form_event.dart';
import 'package:ticketify/blocs/submit_organiser_form/form_state.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/domain/usecases/events.dart';

class SubmitOrganiserFormBloc extends Bloc<SubmitOrganiserFormEvent, SubmitOrganiserFormState>{
  final FetchEvents events;
  SubmitOrganiserFormBloc({required this.events}):super(SubmissionInitial()){
    on<SubmissionRequest>(_submissionRequest);
  }

  Future<void> _submissionRequest(SubmissionRequest event, Emitter<SubmitOrganiserFormState> emit) async {
    emit(SubmissionLoading());
    try{
      final ApiResponse apiResponse = await events.repository.storeEvents(event.featuredEventModel);
      if(apiResponse.code == 200){
        emit(SubmissionSuccess());
      }else{
        emit(SubmissionFailed(e: apiResponse.data));
      }
    }catch(e){
      return emit(SubmissionFailed(e: e.toString()));
    }
  }

}