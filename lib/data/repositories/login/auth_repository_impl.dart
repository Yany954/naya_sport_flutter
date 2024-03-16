//auth_repository_impl.dart
import '../../services/login/auth_service_impl.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthServiceImpl authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<int?> login(String email, String password) async {
    // Aquí puedes implementar la lógica para llamar al servicio de autenticación
    // y obtener los datos del usuario.
    final responseCode = await authService.login(email, password);
    return responseCode;
  }
  @override
  Future<int?> register(String email, String password) async {
    // Aquí puedes implementar la lógica para llamar al servicio de autenticación
    // y obtener los datos del usuario.
    //201
    final responseCode = await authService.register(email, password);
    return responseCode;
  }
}
