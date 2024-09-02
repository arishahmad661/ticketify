sealed class AuthState{}

final class AuthInitial extends AuthState {}

final class Unauthorised extends AuthState {}

final class AuthLoading extends AuthState {}

final class SplashLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String? uid;
  AuthSuccess({required this.uid});
}

final class AuthFailure extends AuthState {
  final String? err;
  AuthFailure({required this.err});
}

final class GoogleSignInSuccess extends AuthState{
  GoogleSignInSuccess();
}