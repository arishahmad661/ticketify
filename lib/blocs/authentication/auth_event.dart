sealed class AuthEvent{}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested({required this.email, required this.password});
}

final class AuthLogOutRequested extends AuthEvent {}

final class GoogleSignInRequested extends AuthEvent {}

final class AuthInitialRequested extends AuthEvent {}

final class SignINPageRequested extends AuthEvent {}
