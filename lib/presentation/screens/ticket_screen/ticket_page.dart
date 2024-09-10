import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ticketify/data/models/attendes_model.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/screens/ticket_screen/widget/ticket.dart';
import 'package:ticketify/presentation/widgets/common_button.dart';
import '../home_screen/widgets/display_featured_event_card.dart';

class TicketPage extends StatelessWidget {
  AttendeesModel attendeesModel;
  FeaturedEventModel featuredEventModel;

  TicketPage({super.key, required this.attendeesModel, required this.featuredEventModel});

  @override
  Widget build(BuildContext context) {
    String qrData = jsonEncode(attendeesModel);
    String organiserLists = organisersText(featuredEventModel.organisersName);
    ScreenshotController screenshotController = ScreenshotController();

    Future<void> saveScreenshot() async {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }

      if (status.isGranted) {
        Directory? downloadsDirectory;

        // For Android
        if (Platform.isAndroid) {
          downloadsDirectory = Directory('/storage/emulated/0/Download');
        }
        // For iOS, use the 'getApplicationDocumentsDirectory' as iOS doesn't have a 'Downloads' directory
        else if (Platform.isIOS) {
          downloadsDirectory = await getApplicationDocumentsDirectory();
        }

        if (downloadsDirectory != null) {
          final path = Directory(downloadsDirectory.path);

          if (!(await path.exists())) {
            await path.create();
          }

          String fileName = "${featuredEventModel.name}.jpg";
          String filePath = '${path.path}/$fileName';

          screenshotController.capture().then((Uint8List? image) {
            if (image != null) {
              File imgFile = File(filePath);
              imgFile.writeAsBytes(image);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ticket Code saved to $filePath')),
              );
            }
          }).catchError((onError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(onError)),
            );
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission denied')),
        );
      }
    }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Ticket(screenshotController, context, organiserLists, qrData, attendeesModel, featuredEventModel),
                SizedBox(height: 40,),
                CommonTextButton(function: saveScreenshot, buttonText: "Download"),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
