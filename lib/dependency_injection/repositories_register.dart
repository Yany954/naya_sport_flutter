import '../../../data/repositories/login/auth_repository_impl.dart';
import '../../../data/services/login/auth_service_impl.dart';
import '../../../domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

void setupLocator() {
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(AuthServiceImpl()));
}
