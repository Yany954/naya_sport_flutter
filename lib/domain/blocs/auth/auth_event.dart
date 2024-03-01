// AuthEvent representa los eventos que pueden ocurrir en la autenticación
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
