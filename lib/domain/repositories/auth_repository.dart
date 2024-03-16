//auth_repository.dart
import '../entities/user.dart';

abstract class AuthRepository {
  Future<int?> login(String email, String password);
  Future<int?> register(String email, String password);
}
