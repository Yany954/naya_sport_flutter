//login_use_case.dart
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<int?> login(String email, String password) async {
    return _authRepository.login(email, password);
  }
  Future<int?> register(String email, String password) async {
    return _authRepository.register(email, password);
  }
}
