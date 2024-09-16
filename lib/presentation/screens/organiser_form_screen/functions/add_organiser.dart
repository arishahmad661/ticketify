import 'package:flutter/material.dart';

List<Map<String, TextEditingController>> addOrganiser(List<Map<String, TextEditingController>> organisers) {
    organisers.add({
      'organiserName': TextEditingController(),
      'organiserDescription': TextEditingController(),
      'organiserEmail': TextEditingController(),
      'organiserMobileNumber': TextEditingController(),
      'organiserLocation': TextEditingController(),
      'organiserMainLogo': TextEditingController(),
    });
    return organisers;
}