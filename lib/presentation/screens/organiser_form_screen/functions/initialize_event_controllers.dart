import 'package:flutter/material.dart';

List<Map<String, TextEditingController>> initializeEventController(List<Map<String, TextEditingController>> eventControllers) {
  eventControllers.add({
    'name': TextEditingController(),
    'description': TextEditingController(),
    'cost': TextEditingController(),
    'location': TextEditingController(),
    'mainLogo': TextEditingController(),
  });
  return eventControllers;
}