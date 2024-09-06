import 'dart:convert';
import 'package:ticketify/data/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:ticketify/data/models/attendes_model.dart';
import 'package:ticketify/data/models/order_id_request.dart';
import 'package:ticketify/data/models/payment_success_response_model.dart';
import 'package:ticketify/storage/storage_client.dart';
import 'package:ticketify/utils/url.dart';

class EventRegistrationDataSource{
  final http.Client client;
  EventRegistrationDataSource(this.client);

  Future<ApiResponse> eventRegistrationCheck(String eventID) async {
    try{
      Storage storage = Storage();
      String? userID = await storage.fetchUserId();
      if(userID.isEmpty || userID == ""){
        return ApiResponse(code: 404, error: "UserID not found. Try logging in again or clear the cache.");
      }
      final response = await client.post(
          Uri.parse('${baseURL}/api/v1/registration-check'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'userId': userID,
            "eventId": eventID
          })
      );
      if(response.statusCode == 200){
        final AttendeesModel attendeesModel = AttendeesModel.fromJson(json.decode(response.body));
        return ApiResponse(data: attendeesModel, code: 200);
      } else if(response.statusCode == 404){
        return ApiResponse(error: "Attendee not found", code: 404);
      }else{
        return ApiResponse(error: "Unexpected error occurred.", code: response.statusCode);
      }
    }catch(e) {
      return ApiResponse(error: e.toString());
    }

  }

  Future<ApiResponse> eventRegistration(String eventID) async {
    try{
      Storage storage = Storage();
      String userID = await storage.fetchUserId();
      String userName = await storage.fetchUserName();
      String userEmail = await storage.fetchUserEmail();
      String userPhoneNumber = await storage.fetchUserPhoneNumber();
      if (userID == "" && userName == "" && userEmail == "" && userID.isEmpty && userName.isEmpty && userEmail.isEmpty) {
        return ApiResponse(error: "Clear cache of the application or try logout and then login", code: 404);
      }

      AttendeesModel attendeesModel = AttendeesModel(
        userEmail: userEmail,
        userId: userID,
        userName: userName,
        isCheckedIn: false,
        userPhoneNumber: userPhoneNumber,
      );

      final response = await client.post(
          Uri.parse('${baseURL}/api/v1/register-user'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'eventId': eventID,
            'attendee': attendeesModel
          })
      );

      if(response.statusCode == 200){
        final AttendeesModel attendeesModel = AttendeesModel.fromJson(json.decode(response.body));
        return ApiResponse(data: attendeesModel, code: 200);
      } else if(response.statusCode == 404){
        return ApiResponse(error: "Attendee not found", code: 404);
      }else{
        return ApiResponse(error: "Unexpected error occurred.", code: response.statusCode);
      }
    }catch(e) {
      return ApiResponse(error: e.toString());
    }

  }

  Future<ApiResponse> createOrderID(OrderIDRequest orderIDRequest) async {
    try{
      final response = await client.post(
          Uri.parse('${baseURL}/api/v1/create-order'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'currency': orderIDRequest.currency,
            'amount': orderIDRequest.amount
          })
      );
      if(response.statusCode == 200){
        return ApiResponse(code: 200, data: response.body);
      }else{
        return ApiResponse(code: response.statusCode, error: response.body);
      }
    }catch(e){
      return ApiResponse(data: e);
    }
  }

  Future<ApiResponse> verifyPayment(PaymentSuccessResponseModel paymentSuccessResponseModel) async {
    try{
      final response = await client.post(
          Uri.parse('${baseURL}/api/v1/verify-payment'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(paymentSuccessResponseModel.toJson())
      );
      if(response.statusCode == 200){
        return ApiResponse(code: 200, data: response.body);
      }else{
        print(response.body);
        return ApiResponse(code: response.statusCode, error: response.body);
      }
    }catch(e){
      print(e.toString());
      return ApiResponse(data: e);
    }
  }

}