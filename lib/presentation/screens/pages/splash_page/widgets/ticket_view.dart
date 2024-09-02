import 'package:flutter/material.dart';
import 'package:ticketify/presentation/widgets/ticket_clipper.dart';

Widget ticketView({title, desc}) {
  return SizedBox(
    height: 150,
    child: Row(
      children: [
        ClipPath(
            clipper: TicketClipper(),
            child: Container(color: const Color.fromARGB(255,87,33,72), width: 100,)),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight:  Radius.circular(10)),
              color: Colors.blueGrey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8,),
                  Text(desc, style: const TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
