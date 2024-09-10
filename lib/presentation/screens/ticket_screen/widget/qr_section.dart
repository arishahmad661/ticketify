import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../data/models/attendes_model.dart';
import '../../../widgets/text.dart';

Widget qrSection(AttendeesModel attendeesModel, String qrData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Ticket ID: ${attendeesModel.id}", style: textStyle(color: Colors.black54)),
      const SizedBox(height: 16.0,),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 120,
          child: QrImageView(
            data: qrData != null && qrData.isNotEmpty ? qrData : 'QR Data is missing',
            version: QrVersions.auto,
            size: 120,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      const Text("Scan at the venue"),
    ],
  );
}
