import '../entities/user.dart';

abstract class AuthService {
  Future<int?> login(String email, String password);
}
