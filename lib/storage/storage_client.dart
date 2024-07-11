import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  Future<void> storeSignInData(UserCredential userCredential) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', userCredential.user!.uid.toString());
    await prefs.setString('displayName', userCredential.user!.displayName.toString());
    await prefs.setString('email', userCredential.user!.email.toString());
    await prefs.setString('photoURL', userCredential.user!.photoURL.toString());
    await prefs.setString('phoneNumber', userCredential.user!.phoneNumber.toString());
  }
  Future<String?> fetchUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString('userID');
    return userID;
  }
}