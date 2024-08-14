import 'package:flutter/material.dart';

import '../../ticket_page/ticket_page.dart';

Widget registerButton({required BuildContext context, required String eventID, required Function(BuildContext, String) onRegister}) {
  return Align(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: (){
        onRegister(context, eventID);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,253,177,75)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(const Size(160, 50)),

      ),
      child: const Text("Register", style: TextStyle(color: Color.fromARGB(255,87,33,72), fontSize: 16),),
    ),
  );
}

Widget buildDownloadTicketButton({required context, required qrData, required eventDetails}) {
  return Align(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TicketPage(qrData: qrData, featuredEventModel: eventDetails, ),));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,253,177,75)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(const Size(160, 50)),

      ),
      child: const Text("Get The Ticket", style: TextStyle(color: Color.fromARGB(255,87,33,72), fontSize: 16),),
    ),
  );
}
