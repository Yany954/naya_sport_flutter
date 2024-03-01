// auth_state.dart
import '../../entities/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final int? statusCode;

  AuthAuthenticated({required this.statusCode});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
