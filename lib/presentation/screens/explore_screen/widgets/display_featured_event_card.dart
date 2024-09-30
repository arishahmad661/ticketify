import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';
import 'package:ticketify/presentation/widgets/text.dart';
import '../../event_screen/event_page.dart';


Widget displayEventCard({required FeaturedEventModel featuredEvent, required context}) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(featuredEvent: featuredEvent,),));
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
                      Flexible(child: Text(featuredEvent.organisersName,maxLines: 1, overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize:14,color: Colors.black54),)),
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
}