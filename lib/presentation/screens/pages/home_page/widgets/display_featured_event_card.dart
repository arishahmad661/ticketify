import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';
import '../../event_page/event_page.dart';

Widget displayEventCard({required featuredEvent, required context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(featuredEvent: featuredEvent,),));
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 87, 33, 72),),
            // boxShadow: [const BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 1)],
            borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                child: buildNetworkImage(imgURL: featuredEvent.mainLogo),
              ),
              Flexible(child: Text(featuredEvent.name,maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:20),)),
              Row(
                children: [
                  const Icon(Icons.pin_drop),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(featuredEvent.location == "" ? "Online" : featuredEvent.location),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month_rounded),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(DateFormat('dd/MM/yyyy').format(featuredEvent.fromTime)),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.currency_rupee),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(featuredEvent.cost.toString() == "0" ? "Free" : featuredEvent.cost.toString()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
