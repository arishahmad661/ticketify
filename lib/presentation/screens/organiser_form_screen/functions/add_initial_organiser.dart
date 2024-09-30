import 'package:flutter/material.dart';

Map<String, TextEditingController> addInitialOrganiser(Map<String, TextEditingController> organisers) {
  organisers['organiserName'] = TextEditingController();
  organisers['organiserDescription'] = TextEditingController();
  organisers['organiserEmail'] = TextEditingController();
  organisers['organiserMobileNumber'] = TextEditingController();
  organisers['organiserLocation'] = TextEditingController();
  organisers['organiserMainLogo'] = TextEditingController();
  return organisers;
}