import 'package:flutter/material.dart';

Map<String, TextEditingController> initializeEventController(Map<String, TextEditingController> eventController) {
  eventController['name'] = TextEditingController();
  eventController['description'] = TextEditingController();
  eventController['cost'] = TextEditingController();
  eventController['location'] = TextEditingController();
  eventController['mainLogo'] = TextEditingController();
  return eventController;
}