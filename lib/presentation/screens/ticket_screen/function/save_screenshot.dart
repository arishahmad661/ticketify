import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

Future<void> saveScreenshot(String name, ScreenshotController screenshotController, BuildContext context) async {
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

      String fileName = "${name}.jpg";
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
