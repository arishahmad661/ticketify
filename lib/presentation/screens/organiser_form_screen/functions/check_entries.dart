import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/submit_organiser_form/form_bloc.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import '../../../../blocs/submit_organiser_form/form_event.dart';
import '../../../../utils/enum.dart';
import '../widget/snackbar.dart';

void checkEntriesSubmitForm(Map<String, TextEditingController> organiser, Map<String, TextEditingController> eventController, BuildContext context, PageController ctrl, bool isRead, bool isChecked, EventMode mode, Cost cost) {
  if (organiser['organiserName']!.text.isEmpty ||
      organiser['organiserName']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Organiser name is missing.",
        buttonLabel: 'OK',
        jumpToPage: 0,
        ctrl: ctrl));
    return;
  }
  if (organiser['organiserDescription']!.text.isEmpty ||
      organiser['organiserDescription']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Organiser Descritption is missing.",
        buttonLabel: 'OK',
        jumpToPage: 0,
        ctrl: ctrl));
    return;
  }
  if (organiser['organiserEmail']!.text.isEmpty ||
      organiser['organiserEmail']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Organiser Email is missing.",
        buttonLabel: 'OK',
        jumpToPage: 0,
        ctrl: ctrl));
    return;
  }
  if (organiser['organiserMobileNumber']!.text.isEmpty ||
      organiser['organiserMobileNumber']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Organiser Mobile Number is missing.",
        buttonLabel: 'OK',
        jumpToPage: 0,
        ctrl: ctrl));
    return;
  }
  if (organiser['organiserLocation']!.text.isEmpty ||
      organiser['organiserLocation']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Organiser Location is missing.",
        buttonLabel: 'OK',
        jumpToPage: 0,
        ctrl: ctrl));
    return;
  }
  if (organiser['organiserMainLogo']!.text.isEmpty ||
      organiser['organiserMainLogo']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Organiser Man Logo is missing.",
        buttonLabel: 'OK',
        jumpToPage: 0,
        ctrl: ctrl));
    return;
  }

  if (eventController['name']!.text.isEmpty ||
      eventController['name']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Event name is missing.",
        buttonLabel: 'OK',
        jumpToPage: 1,
        ctrl: ctrl));
    return;
  }
  if ((eventController['cost']!.text.isEmpty && cost == Cost.paid) ||
      (eventController['cost']!.text == "" && cost == Cost.paid)) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Event cost is missing.",
        buttonLabel: 'OK',
        jumpToPage: 4,
        ctrl: ctrl));
    return;
  }
  if (eventController['description']!.text.isEmpty ||
      eventController['description']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Event Description is missing.",
        buttonLabel: 'OK',
        jumpToPage: 2,
        ctrl: ctrl));
    return;
  }
  if ((eventController['location']!.text.isEmpty &&
      mode == EventMode.offline) ||
      (eventController['location']!.text == "" && mode == EventMode.offline)) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Event Location is missing.",
        buttonLabel: 'OK',
        jumpToPage: 4,
        ctrl: ctrl));
    return;
  }
  if (eventController['mainLogo']!.text.isEmpty ||
      eventController['mainLogo']!.text == "") {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Event Main Logo is missing.",
        buttonLabel: 'OK',
        jumpToPage: 3,
        ctrl: ctrl));
    return;
  }

  if (!isRead || !isChecked) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(
        text: "Please check all the boxes.",
        buttonLabel: 'OK',
        jumpToPage: 5,
        ctrl: ctrl));
    return;
  }
      FeaturedEventModel featuredEventModel = FeaturedEventModel(
      registrationDeadline: DateTime.now().toUtc(),
      eventId: "",
      cost: cost == Cost.paid ? int.parse(eventController['cost']!.text) : 0,
      description: eventController['description']!.text,
      fromTime: DateTime.now().toUtc(),
      toTime: DateTime.now().toUtc(),
      isOffline: mode == EventMode.offline ? true : false,
      location: mode == EventMode.offline ? eventController['location']!.text : "",
      mainLogo: eventController['mainLogo']!.text,
      name: eventController['name']!.text,
      organisersName: organiser['organiserName']!.text,
      organisersMainLogo: organiser['organiserMainLogo']!.text,
      organiserDescription: organiser['organiserDescription']!.text,
      organiserEmail: organiser['organiserEmail']!.text,
      organiserMobileNumber: organiser['organiserMobileNumber']!.text,
      organiserLocation: organiser['organiserLocation']!.text,
  );
  context.read<SubmitOrganiserFormBloc>().add(SubmissionRequest(featuredEventModel));
}
