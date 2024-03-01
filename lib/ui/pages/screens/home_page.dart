import 'package:flutter/material.dart';
import 'package:naya_sport_flutter/ui/pages/authentication/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Página de inicio'),
      ),
    );
  }

  // Función para realizar logout
  Future<void> _logout(BuildContext context) async {
    // Eliminar el accessToken de SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');

    // Redirigir a la pantalla de login
    MaterialPageRoute(builder: (context) =>  LoginPage());
  }
}
