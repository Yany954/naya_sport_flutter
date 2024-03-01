//auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/user.dart';
import '../../usecases/login_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase; // Cambia AuthService por LoginUseCase

  AuthBloc(this.loginUseCase) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      try {
        final statusCode = await loginUseCase.login(event.email, event.password);
        yield AuthAuthenticated(statusCode: statusCode);
      } catch (e) {
        yield AuthError(message: 'Error al iniciar sesión');
      }
    }
  }
}