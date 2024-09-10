import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ticketify/data/models/attendes_model.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/ticket_screen/widget/qr_section.dart';
import '../../../widgets/build_network_image.dart';
import '../../../widgets/separator.dart';
import '../../../widgets/text.dart';

Widget Ticket(ScreenshotController screenshotController, BuildContext context, String organiserLists, String qrData, AttendeesModel attendeesModel, FeaturedEventModel featuredEventModel) {
  return Screenshot(
    controller: screenshotController,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 370
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNetworkImage(imgURL: featuredEventModel.images[0], width: MediaQuery.of(context).size.width - 16 - 16 - 8 - 8 - 16 - 16),
                const SizedBox(height: 8,),
                Text(featuredEventModel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:16),),
                Text(organiserLists,style: const TextStyle(fontSize:14,color: Colors.black),),
                const SizedBox(height: 16,),
                Text(DateFormat('EEE, MMM d • h:mm a').format(featuredEventModel.fromTime).toUpperCase(), style: textStyle(color: Colors.blue, fontWeight: FontWeight.bold)),

                Row(
                  children: [
                    Icon(featuredEventModel.location == "" ?Icons.videocam : Icons.location_on, color: Colors.black54, size: 20,),
                    const SizedBox(width: 8.0,),
                    Flexible(
                      child: Text(
                        featuredEventModel.location == "" ? "Online event" : featuredEventModel.location,
                        style: textStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.payments, color: Colors.black54, size: 20,),
                    const SizedBox(width: 8.0,),
                    Text(featuredEventModel.cost.toString() != "0" ? featuredEventModel.cost.toString() : "No fee applicable", style: textStyle(color: Colors.black54), overflow: TextOverflow.ellipsis, maxLines: 5,),
                  ],
                ),

                const SizedBox(height: 16.0,),
                Seperator(),
                const SizedBox(height: 16.0,),
                qrSection(attendeesModel, qrData),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

