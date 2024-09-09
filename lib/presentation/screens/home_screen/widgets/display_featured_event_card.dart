import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/event_page/event_page.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';
import 'package:ticketify/presentation/widgets/text.dart';

String organisersText(List<String> list){
  String organisersList = "";
  for(int i = 0; i < list.length; i++){
    organisersList += list[i];
    if(i <= list.length - 2){
      organisersList += ", ";
    }
  }
  return organisersList;
}

Widget displayEventCard({required FeaturedEventModel featuredEvent, required context}) {
  String organiserLists = organisersText(featuredEvent.organisersName);
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(featuredEvent: featuredEvent,),));
    },
    child: SizedBox(
      width: 200,
      child: Card(
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                  child: buildNetworkImage(imgURL: featuredEvent.mainLogo),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left:8.0, right:8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('EEE, MMM d • h:mm a').format(featuredEvent.fromTime).toUpperCase(), style: textStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4,),
                      Flexible(child: Text(featuredEvent.name,maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:14),)),
                      SizedBox(height: 4,),
                      Flexible(child: Text(organiserLists,maxLines: 1, overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize:14,color: Colors.black54),)),
                    ],
                  ),
                ),
           ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(featuredEvent.location == "" ?Icons.videocam : Icons.location_on, color: Colors.black54, size: 20,),
                      SizedBox(width: 8.0,),
                      Flexible(child: Text(featuredEvent.location == "" ? "Online event" : featuredEvent.location, style: textStyle(color: Colors.black54), overflow: TextOverflow.ellipsis)),
                      SizedBox(width: 8.0,),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.payments, color: Colors.black54, size: 20,),
                      SizedBox(width: 8.0,),
                      Flexible(child: Text(featuredEvent.cost.toString() != "0" ? featuredEvent.cost.toString() : "No fee applicable", style: textStyle(color: Colors.black54), overflow: TextOverflow.ellipsis)),
                      SizedBox(width: 8.0,),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
  );
    // old(context, featuredEvent);
}

Padding old(context, featuredEvent) {
  return Padding(
  padding: const EdgeInsets.all(8.0),
  child: InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(featuredEvent: featuredEvent,),));
    },
    child: ont(featuredEvent),
  ),
);
}

Container ont(featuredEvent) {
  return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 87, 33, 72),),
          // boxShadow: [const BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 1)],
          borderRadius: BorderRadius.circular(5)
      ),
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
    );
}
