import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../storage/storage_client.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitial()){
    on<AuthInitialRequested>(_authInitialRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogOutRequested>(_onLogOutRequested);
    on<GoogleSignInRequested>(_googleSignInRequested);
    on<SignINPageRequested>(_signINPageRequested);
  }

  void _authInitialRequested(
      AuthInitialRequested event,
      Emitter<AuthState> emit,
      ){
    emit(AuthLoading());
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return emit(GoogleSignInSuccess());
    }else{
      return emit(SplashLoading());
    }
  }

  void _signINPageRequested(
      SignINPageRequested event,
      Emitter<AuthState> emit,
      ){
    return emit(Unauthorised());
  }

  void _onLoginRequested(
      AuthLoginRequested event,
      Emitter<AuthState> emit,
      ){
    emit(AuthLoading());
    try{
      final email = event.email;
      final password = event.password;
      if(password.length < 6){
        return emit(AuthFailure(err: "Failure"));
      }
      return emit(AuthSuccess(uid: "success"));
    }
    catch(e){
      return emit(AuthFailure(err: "Failure"));
  }
  }
  void _onLogOutRequested(
  AuthLogOutRequested event,
  Emitter<AuthState> emit
  ){
    emit(AuthLoading());
    try{
      return emit(Unauthorised());
  }
  catch(e){
      return emit(AuthFailure(err: "Failure"));
  }
  }

  Future<void> _googleSignInRequested(
      GoogleSignInRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      // if(kIsWeb){
      //   FirebaseAuth auth = FirebaseAuth.instance;
      //   GoogleAuthProvider authProvider = GoogleAuthProvider();
      //   authProvider.addScope("https://www.googleapis.com/auth/calendar.events");
      //   // User? user;
      //   final UserCredential userCredential = await auth.signInWithPopup(authProvider);
      //   // user = userCredential.user;
      //   Storage storage = Storage();
      //   storage.storeSignInData(userCredential);
      // }else {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/calendar.events', // Add the required scope here
        ],
      );

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        Storage _storage = Storage();
        _storage.storeSignInData(userCredential, googleAuth.accessToken, googleAuth.idToken);
      // }

      return emit(GoogleSignInSuccess());
    }catch (e) {
      return emit(AuthFailure(err: "Failure"));
    }
  }
}