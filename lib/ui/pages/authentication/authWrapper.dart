//authWrapper.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/naya_sport_screen.dart';
import 'login_page.dart';
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isAuthenticated(), // Verifica si el usuario está autenticado
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra un indicador de carga mientras se verifica la autenticación
          return CircularProgressIndicator();
        } else {
          // Basado en el resultado de la verificación, muestra la página apropiada
          final bool isAuthenticated = snapshot.data ?? false;
          return isAuthenticated ? NayaSportStore() : LoginPage();
        }
      },
    );
  }

  Future<bool> isAuthenticated() async {
    // Obtén una instancia de SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('accessToken')) {
      final accessToken = prefs.getString('accessToken');
      print('AccessToken: $accessToken');
      return true;
    } else {
      return false;
    }
  }
}