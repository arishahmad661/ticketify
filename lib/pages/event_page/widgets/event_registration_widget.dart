import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/bloc/event_registration/event_registration_bloc.dart';
import 'package:ticketify/bloc/event_registration/event_registration_event.dart';
import 'package:ticketify/bloc/event_registration/event_registration_state.dart';
import 'package:ticketify/common/widgets/text.dart';
import 'package:ticketify/pages/ticket_page/ticket_page.dart';
import '../../../models/featured_events_model.dart';

class EventRegistrationWidget extends StatefulWidget {
  String eventID;
  FeaturedEventModel eventDetails;
  EventRegistrationWidget({super.key, required this.eventID, required this.eventDetails});

  @override
  State<EventRegistrationWidget> createState() => _EventRegistrationWidgetState();
}

class _EventRegistrationWidgetState extends State<EventRegistrationWidget> {
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  String? profession = "undergraduate";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCtrl =  TextEditingController();
    emailCtrl = TextEditingController();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          const SizedBox(height: 8,),
          Align(
            alignment: Alignment.topRight,
              child: InkWell(
                onTap: (){Navigator.pop(context);},
                  child: const Text("cancel"))),
          Text(
            textAlign: TextAlign.center,
            "RSVP for the event", style: textStyle(color: const Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold, fontSize: 32.0, ),
          ),
          const SizedBox(height: 16,),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      hintText: "John Smith",
                      labelStyle: textStyle(color: const Color.fromARGB(255,87,33,72)),
                      focusColor: const Color.fromARGB(255,87,33,72),
                      fillColor: const Color.fromARGB(255,87,33,72),
                      hoverColor: const Color.fromARGB(255,87,33,72),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255,87,33,72))),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                  ),
                  controller: nameCtrl,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: "john@smith.com",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                  ),
                ),
                const SizedBox(height: 16,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "I am a...",
                    labelText: "I am a...",
                    labelStyle: textStyle(color: Colors.black54),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.black54)
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.black54)
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.black54)
                    ),
                  ),
                  value: profession,
                  items: [
                    DropdownMenuItem(
                      value: "undergraduate",
                      child: Text("Undergraduate", style: textStyle(color: Colors.black),),
                    ),
                    DropdownMenuItem(
                      value: "graduate_masters",
                      child: Text("Graduate Master's", style: textStyle(color: Colors.black),),
                    ),
                    DropdownMenuItem(
                      value: "graduate_phd",
                      child: Text("Undergraduate Doctorate/PhD", style: textStyle(color: Colors.black),),
                    ),
                    DropdownMenuItem(
                      value: "working_professional",
                      child: Text("Working Professional", style: textStyle(color: Colors.black),),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      profession = newValue;
                    });
                  },
                )

              ],
            ),
          ),
          const SizedBox(height: 16,),
          BlocConsumer<EventRegistrationBloc, EventRegistrationState>(
            listener:(context, state){
              if(state is SubmitError){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.e.toString(),
                    ),
                  ),
                );
              }
              else if(state is SubmitSuccessful){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => TicketPage(qrData: state.qrData, featuredEventModel: widget.eventDetails, ),));
              }
            },
            builder: (context, state) {
              if(state is InitialState) {
                return TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 253, 177, 75)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    minimumSize: MaterialStateProperty.all(const Size(160, 50)),
                  ),
                  onPressed: () {
                    BlocProvider.of<EventRegistrationBloc>(context).add(
                      SubmitRequested(eventID: widget.eventID, email: emailCtrl.text, name: nameCtrl.text, profession: profession ?? "Student")
                    );
                  },
                  child: const Text("Submit", style: TextStyle(
                      color: Color.fromARGB(255, 87, 33, 72), fontSize: 16),)
              );
              } else if(state is LoadingState || state is SubmitSuccessful) return const Center(child: CircularProgressIndicator(),);
              else return const Text("Something unexpected occured.");
            }
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
