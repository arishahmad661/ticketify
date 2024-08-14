import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:ticketify/common/widgets/text.dart';
import '../../../common/widgets/ticket_clipper.dart';

Widget ticket({required footerText ,required title, required desc, required BuildContext context, required eventID}) {
  return SwipeTo(
    onLeftSwipe: (details){
    },
    onRightSwipe: (details){
    },
    child: SizedBox(
      height: 180,
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
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                          child: Text(footerText, style:  textStyle(fontStyle: FontStyle.italic, color: Colors.black54)
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}