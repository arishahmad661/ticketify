import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ticketify/data/models/attendes_model.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/ticket_screen/function/save_screenshot.dart';
import 'package:ticketify/presentation/screens/ticket_screen/widget/ticket.dart';
import 'package:ticketify/presentation/widgets/common_button.dart';
import 'package:ticketify/presentation/widgets/loading_indicator.dart';
import '../home_screen/widgets/display_featured_event_card.dart';
import 'function/get_image.dart';

class TicketPage extends StatelessWidget {
  AttendeesModel attendeesModel;
  FeaturedEventModel featuredEventModel;

  TicketPage({super.key, required this.attendeesModel, required this.featuredEventModel});

  @override
  Widget build(BuildContext context) {
    String qrData = jsonEncode(attendeesModel);
    String organiserLists = organisersText(featuredEventModel.organisersName);
    ScreenshotController screenshotController = ScreenshotController();


    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true); // Pass true to indicate a refresh
        return false; // Prevent the default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ticket"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: getImages(featuredEventModel.images[0], MediaQuery.of(context).size.width - 16 - 16 - 8 - 8 - 16 - 16),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildLoadingIndicator();
                }else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if(snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Ticket(screenshotController, context, organiserLists, qrData, attendeesModel, featuredEventModel, snapshot.data),
                      const SizedBox(height: 40,),
                      CommonTextButton(
                          function: (){
                            saveScreenshot(featuredEventModel.name, screenshotController, context);
                            },
                          buttonText: "Download"),
                    ],
                  );
                } else {
                  return const Text('Something went wrong');
                }
              }
            ),
          ),
        ),
      ),
    );
  }


}
