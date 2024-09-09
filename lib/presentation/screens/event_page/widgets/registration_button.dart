import 'package:flutter/material.dart';
import '../../ticket_page/ticket_page.dart';


Widget buildDownloadTicketButton({required context, required qrData, required eventDetails}) {
  return Align(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TicketPage(qrData: qrData, featuredEventModel: eventDetails, ),));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,251,88,80)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        minimumSize: MaterialStateProperty.all(const Size(160, 50)),

      ),
      child: const Text("Get The Ticket", style: TextStyle(color: Colors.white, fontSize: 16),),
    ),
  );
}
