import 'package:flutter/material.dart';
import 'package:naya_sport_flutter/ui/pages/authentication/authWrapper.dart';
import 'package:naya_sport_flutter/ui/pages/screens/naya_sport_screen.dart';
import 'package:naya_sport_flutter/ui/providers/selected_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repositories/login/auth_repository_impl.dart';
import 'data/services/login/auth_service_impl.dart';
import 'domain/repositories/auth_repository.dart';

/*void main() {
  runApp(
    ChangeNotifierProvider<SelectedScreenProvider>(
      create: (context) => SelectedScreenProvider(),
      child: const NayaSportStore(),
    ),
  );
}*/
final GetIt injector = GetIt.instance;

void setupLocator() {
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(AuthServiceImpl()));
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedScreenProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: AuthenticationWrapper(),
      ),
    );
  }
}