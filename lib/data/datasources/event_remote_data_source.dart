import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticketify/data/models/api_response.dart';
import '../models/featured_events_model.dart';

class EventRemoteDataSource {
  final http.Client client;
  EventRemoteDataSource(this.client);

  Future<ApiResponse> fetchEvents() async {
    // Network Access: If you are running the app on an emulator or physical device, localhost might refer to the emulator or device itself. For an emulator, use http://10.0.2.2 instead of localhost to access your local server.
    // Connectivity: Ensure that your device or emulator has internet access and can reach the server.
    // On your computer, open a terminal or command prompt and use the following command to find your local IP address:
    // Windows: ipconfig
    // Look for the “IPv4 Address” under your active network connection.
    // Make sure your server is bound to all network interfaces, not just localhost. You may need to modify the binding address in your server configuration to 0.0.0.0 or your local IP address.

    try {
      final response = await client.get(Uri.parse('http://192.168.107.217:8080/api/v1/featured-events'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final events = data.map((json) => FeaturedEventModel.fromJson(json)).toList();
        return ApiResponse(data: events, code: 200);
      } else {
        return ApiResponse(error: "Failed to load events" , code: response.statusCode);
      }
    }catch(error){
      return ApiResponse(error: "Failed to load events. Error: ${error}");
    }

  }
}
