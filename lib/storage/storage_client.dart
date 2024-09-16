import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketify/data/models/storage_model.dart';

class Storage{
  Future<void> storeSignInData(UserCredential userCredential, String? accessToken,String? idToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StorageModel storageModel = StorageModel.fromJson(userCredential, accessToken, idToken);
    await prefs.setString('userID', storageModel.userId.toString());
    await prefs.setString('displayName', storageModel.displayName.toString());
    await prefs.setString('email', storageModel.email.toString());
    await prefs.setString('photoURL', storageModel.photoUrl.toString());
    await prefs.setString('phoneNumber', storageModel.phoneNumber.toString());
    await prefs.setString('accessToken',accessToken.toString());
    await prefs.setString('idToken', idToken.toString());
  }

  Future<String> fetchUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString('userID') ??  "";
    return userID ;
  }

  Future<String> fetchUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final displayName = prefs.getString('displayName') ?? "";
    return displayName;
  }

  Future<String> fetchUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? "";
    return email;
  }

  Future<String> fetchUserPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final phoneNumber = prefs.getString('phoneNumber') ?? "";
    return phoneNumber;
  }

  Future<String> fetchUserPhotoURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final photoURL = prefs.getString('photoURL') ?? "";
    return photoURL;
  }

  Future<String> fetchAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? "";
    return accessToken;
  }

  Future<String> fetchIdToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final idToken = prefs.getString('idToken') ?? "";
    return idToken;
  }

  Future<void> deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userID");
    prefs.remove("phoneNumber");
    prefs.remove("photoURL");
    prefs.remove("email");
    prefs.remove("displayName");
    prefs.remove("accessToken");
    prefs.remove("idToken");
  }
}