import 'dart:io';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/widgets/app_bar.dart';
import 'package:ticketify/presentation/widgets/text.dart';

class TicketPage extends StatelessWidget {
  String qrData;
  FeaturedEventModel featuredEventModel;
  TicketPage({super.key, required this.qrData, required this.featuredEventModel});
  String formatDateWithSuffix(DateTime date) {
    var day = DateFormat('d').format(date);
    String suffix = 'th';

    if (day.endsWith('1') && !day.endsWith('11')) {
      suffix = 'st';
    } else if (day.endsWith('2') && !day.endsWith('12')) {
      suffix = 'nd';
    } else if (day.endsWith('3') && !day.endsWith('13')) {
      suffix = 'rd';
    }

    return DateFormat("d'$suffix' MMM yyyy").format(date);
  }

  String formatTime(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }

  String formatDateTime(DateTime dateTime) {
    String datePart = formatDateWithSuffix(dateTime);
    String timePart = formatTime(dateTime);
    return "$datePart, $timePart IST";
  }

  @override
  Widget build(BuildContext context) {

    final formattedFromDateTime = formatDateTime(featuredEventModel.fromTime);
    final formattedToDateTime = formatDateTime(featuredEventModel.toTime);
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

          String fileName = "${featuredEventModel.name}.png";
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
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    color: const Color.fromARGB(255,253,177,75),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QrImageView(
                          data: qrData != null && qrData.isNotEmpty ? qrData : 'QR Data is missing',
                          version: QrVersions.auto,
                          size: 160,
                          foregroundColor: const Color.fromARGB(255, 87, 33, 72),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  featuredEventModel.name, style: textStyle(fontSize: 20.0)),
                                Text("$formattedFromDateTime - $formattedToDateTime", style: textStyle(fontSize: 16.0),),
                                if (featuredEventModel.isOffline) Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(featuredEventModel.location, style: textStyle(fontSize: 16.0)),
                                    )
                                  ],
                                )
                                else Row(
                                  children: [
                                    const Icon(Icons.online_prediction, size: 16,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text("Online", style: textStyle(fontSize: 16.0)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                TextButton(
                    onPressed: (){
                      saveScreenshot();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,251,88,80)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      minimumSize: MaterialStateProperty.all(const Size(160, 50)),

                    ),
                    child: const Text("Download", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
