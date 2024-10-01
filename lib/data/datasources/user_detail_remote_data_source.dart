import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/data/models/storage_model.dart';
import 'package:ticketify/storage/storage_client.dart';
import 'package:ticketify/utils/url.dart';

class UserDetailsDataSource{
  final http.Client client;
  UserDetailsDataSource(this.client);

  Future<ApiResponse> saveUserDetails() async {
    try{
      Storage storage = Storage();
      StorageModel storageModel = await storage.fetchUserInfo();
      final Map<String, dynamic> userDetailData = storageModel.toJsonWithoutTokens();

      final response = await client.post(
        Uri.parse("${baseURL}/api/v1/store-user-details"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userDetailData),
      );

      if(response.statusCode == 200){
        return ApiResponse(code: 200);
      }else{
        return ApiResponse(code : 500, error: response.body);
      }
    }catch(e){
      return ApiResponse(error: e.toString(), code: 500);
    }
  }
}