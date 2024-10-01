import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/domain/repositories/user_details_repository.dart';

class UserDetails{
  UserDetailsRepository userDetailsRepository;
  UserDetails(this.userDetailsRepository);

  Future<ApiResponse> saveUserDetails() async {
    return await userDetailsRepository.saveUserDetails();
  }
}