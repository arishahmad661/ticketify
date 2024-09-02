import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketify/data/models/storage_model.dart';

class Storage{
  Future<void> storeSignInData(UserCredential userCredential) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StorageModel storageModel = StorageModel.fromJson(userCredential);
    await prefs.setString('userID', storageModel.userId.toString());
    await prefs.setString('displayName', storageModel.displayName.toString());
    await prefs.setString('email', storageModel.email.toString());
    await prefs.setString('photoURL', storageModel.photoUrl.toString());
    await prefs.setString('phoneNumber', storageModel.phoneNumber.toString());
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
  Future<void> deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userID");
    prefs.remove("phoneNumber");
    prefs.remove("photoURL");
    prefs.remove("email");
    prefs.remove("displayName");
  }
}