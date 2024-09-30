import 'package:flutter/material.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/build_navigation.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/build_organiser_form_widget.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/common_entry_widget.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/main_section.dart';
import 'package:ticketify/presentation/widgets/build_numeric_field.dart';
import 'package:ticketify/presentation/widgets/text.dart';
import '../../../utils/enum.dart';
import '../../widgets/build_text_field.dart';
import '../../widgets/common_button.dart';
import 'functions/add_initial_organiser.dart';
import 'functions/check_entries.dart';
import 'functions/initialize_event_controllers.dart';

class OrganiserFormScreen extends StatefulWidget {
  const OrganiserFormScreen({super.key});

  @override
  State<OrganiserFormScreen> createState() => _OrganiserFormScreenState();
}

class _OrganiserFormScreenState extends State<OrganiserFormScreen> {

  Map<String, TextEditingController> organiser = {};
  Map<String, TextEditingController> eventController = {};

  bool isOffline = true;

  late DateTime fromTime;
  late DateTime toTime;
  late DateTime registrationDeadline;

  final ctrl = PageController();

  EventMode mode = EventMode.online;
  Cost cost = Cost.unpaid;

  bool isRead = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    organiser = addInitialOrganiser(organiser);
    eventController = initializeEventController(eventController);

    fromTime = DateTime.now();
    toTime = DateTime.now();
    registrationDeadline = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in organiser.values) {
      controller.dispose();
    }

    for (var controller in eventController.values) {
      controller.dispose();
    }

    ctrl.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final pages = [

      buildOrganiserFormWidget(
        organiser: organiser,
      ),

      commonEntryWidget(
          heading: "What's the name of the event ?",
          description: "Choose a name that will give people a clear idea of what the event is about. You can edit this later if you changed your mind.",
          hintText: "Event Name",
          ctrl: eventController['name'],
      ),

      commonEntryWidget(
          heading: "How would you describe the event ?",
          description: "People will see this when we promote your event, but you'll be able to update it later. Your description must meet the community guidelines.",
          hintText: "Event description",
          ctrl: eventController['description'],
      ),

      commonEntryWidget(
        heading: "Choose a logo for your event.",
        description: "Event logos help potential attendees comprehend and remember an event’s name, purpose, and identity more effectively than any other branding tool.\nGive public link from google drive.\nUse image with 1600x840 px.",
        hintText: "Enter the image link.",
        ctrl: eventController['mainLogo'],
      ),

      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Where will the event occur ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Text("Events are held locally, in person and online. We'll connect you with people in your area, and more can join you online. In case of online event the meeting link will be provided 30 minutes prior to the event.",
              style: textStyle(),
            ),
            const SizedBox(height: 8,),
            Column(
              children: [
                RadioListTile(
                  title: const Text("Online"),
                    value: EventMode.online,
                    groupValue: mode,
                    onChanged: (EventMode? value){
                      setState(() {
                        mode = value!;
                      });
                    }),
                RadioListTile(
                    title: const Text("Offline"),
                    value: EventMode.offline,
                    groupValue: mode,
                    onChanged: (EventMode? value){
                      setState(() {
                        mode = value!;
                      });
                    }),
              ],
            ),
            const SizedBox(height: 8,),
            if (mode == EventMode.offline) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tell us about the event location.", style: textStyle(fontSize: 16.0),),
                const SizedBox(height: 8,),
                buildTextField(controller: eventController['location'], hintText: "Location"),
              ],
            ),
            const SizedBox(height: 16,),
            Text("Is the ticket paid ?", style: textStyle(fontSize: 16.0),),
            const SizedBox(height: 8,),
            Column(
              children: [
                RadioListTile(
                    title: const Text("Unpaid"),
                    value: Cost.unpaid,
                    groupValue: cost,
                    onChanged: (Cost? value){
                      setState(() {
                        cost = value!;
                      });
                    }),
                RadioListTile(
                    title: const Text("Paid"),
                    value: Cost.paid,
                    groupValue: cost,
                    onChanged: (Cost? value){
                      setState(() {
                        cost = value!;
                      });
                    }),
              ],
            ),
            const SizedBox(height: 8,),
            if (cost == Cost.paid) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How much is the ticket price ?", style: textStyle(fontSize: 16.0),),
                const SizedBox(height: 8,),
                buildNumericField(controller: eventController['cost'], hintText: "Event ticket price")
              ],
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),

      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Are you sure you want to Submit ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Text("Read the following carefully.", style: textStyle(),),
            Row(
              children: [
                Checkbox(
                    value: isRead,
                    onChanged: (bool? val){
                      setState(() {
                        isRead = val!;
                      });
                    }
                ),
                const Text("I've read all the terms and conditions.")
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? val){
                      setState(() {
                        isChecked = val!;
                      });
                    }
                ),
                const Text("I accept all the terms and conditions.")
              ],
            ),
            const SizedBox(height: 64,),
            Align(
              alignment: Alignment.center,
                child: CommonTextButton(function: (){
                  checkEntries(organiser, eventController, context, ctrl, isRead, isChecked, mode, cost);
                },buttonText: 'Submit', buttonColor: Colors.blueGrey)
            ),
          ],
        ),
      ),

    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Organiser Form"),
      ),
      body: Stack(
        children: [
          buildMainSection(pages, context, ctrl),
          buildNavigation(ctrl: ctrl, length: pages.length)
        ],
      ),
    );
  }



}
