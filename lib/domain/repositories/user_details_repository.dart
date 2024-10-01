import '../../data/models/api_response.dart';

abstract class UserDetailsRepository{
  Future<ApiResponse> saveUserDetails();
}