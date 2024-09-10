import 'package:flutter/material.dart';
import '../../ticket_screen/ticket_page.dart';


Widget buildDownloadTicketButton({required context, required attendeesModel, required eventDetails}) {
  return Align(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TicketPage(featuredEventModel: eventDetails, attendeesModel: attendeesModel, ),));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,251,88,80)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        minimumSize: MaterialStateProperty.all(const Size(160, 50)),

      ),
      child: const Text("See The Ticket", style: TextStyle(color: Colors.white, fontSize: 16),),
    ),
  );
}
