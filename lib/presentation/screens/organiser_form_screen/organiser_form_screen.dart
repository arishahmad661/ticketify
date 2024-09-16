import 'package:flutter/material.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/build_navigation.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/build_organiser_form_widget.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/main_section.dart';
import 'package:ticketify/presentation/widgets/text.dart';
import 'functions/add_initial_organiser.dart';
import 'functions/add_organiser.dart';
import 'functions/initialize_event_controllers.dart';


class OrganiserFormScreen extends StatefulWidget {
  const OrganiserFormScreen({super.key});

  @override
  State<OrganiserFormScreen> createState() => _OrganiserFormScreenState();
}

class _OrganiserFormScreenState extends State<OrganiserFormScreen> {

  List<Map<String, TextEditingController>> organisers = [];
  List<Map<String, TextEditingController>> eventControllers = [];

  late final TextEditingController UPIId;
  late final TextEditingController UPINumber;

  bool isOffline = true;

  late DateTime fromTime;
  late DateTime toTime;
  late DateTime registrationDeadline;


  final ctrl = PageController();

  @override
  void initState() {
    super.initState();
    organisers = addInitialOrganiser(organisers);
    eventControllers = initializeEventController(eventControllers);

    UPIId = TextEditingController();
    UPINumber = TextEditingController();

    fromTime = DateTime.now();
    toTime = DateTime.now();
    registrationDeadline = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();

    for (var organiser in organisers) {
      organiser['organiserName']?.dispose();
      organiser['organiserDescription']?.dispose();
      organiser['organiserEmail']?.dispose();
      organiser['organiserMobileNumber']?.dispose();
      organiser['organiserLocation']?.dispose();
      organiser['organiserMainLogo']?.dispose();
    }

    for (var eventController in eventControllers){
      eventController['name']?.dispose();
      eventController['description']?.dispose();
      eventController['cost']?.dispose();
      eventController['location']?.dispose();
      eventController['mainLogo']?.dispose();
    }

    UPIId.dispose();
    UPINumber.dispose();

    ctrl.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final pages = [
      buildOrganiserFormWidget(organisers: organisers, callback: (){
            setState((){
              organisers = addOrganiser(organisers);
            });
            },),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What's the name of the event ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text("Choose a name that will give people a clear idea of what the event is about. You can edit this later if you changed your mind.",
            style: textStyle(),)
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("How would you describe the event ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text("People will see this when we promote your event, but you'll be able to update it later. Your description must meet the community guidelines.",
            style: textStyle(),)
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Choose a logo for your event.", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text("Event logos help potential attendees comprehend and remember an event’s name, purpose, and identity more effectively than any other branding tool.",
            style: textStyle(),)
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Where will your event located ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text("Events are held locally, in person and online. We'll connect you with people in your area, and more can join you online.",
            style: textStyle(),)
        ],
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
