import 'package:ticketify/data/datasources/user_detail_remote_data_source.dart';
import 'package:ticketify/data/models/api_response.dart';
import 'package:ticketify/domain/repositories/user_details_repository.dart';

class UserDetailsRepositoryImpl implements UserDetailsRepository {
  final UserDetailsDataSource userDetailsDataSource;
  UserDetailsRepositoryImpl(this.userDetailsDataSource);

  @override
  Future<ApiResponse> saveUserDetails() async {
    print("data repository");
    return await userDetailsDataSource.saveUserDetails();
  }

}