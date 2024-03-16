import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/login/auth_repository_impl.dart';
import '../../../data/services/login/auth_service_impl.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../providers/selected_screen_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/naya_sport_screen.dart';
import './text_field_container.dart'; // Importa el widget TextFieldContainer
import './rounded_button.dart'; // Importa el widget RoundedButton

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late LoginUseCase loginUseCase;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    loginUseCase = LoginUseCase(AuthRepositoryImpl(AuthServiceImpl()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                width: 200,
              ),
              SizedBox(height: 30), // Espacio entre el logo y el contenedor
              TextFieldContainer(
                // Usa el widget TextFieldContainer
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Establece el peso de la fuente en negrita
                      ),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Admin',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          // Cambia el color de la línea debajo del texto
                          borderSide: BorderSide(
                              color: Colors.grey), // Especifica el color blanco
                        ),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Establece el peso de la fuente en negrita
                      ),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          // Cambia el color de la línea debajo del texto
                          borderSide: BorderSide(
                              color: Colors.grey), // Especifica el color blanco
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                          }, // Función para alternar visibilidad de la contraseña
                          icon: Icon(Icons.password),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  backgroundColor: Color(0xFF18B9C3),
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () async {
                  final username = _usernameController.text;
                  final password = _passwordController.text;
                  final result = await loginUseCase.register(username, password);
                  if (result == 201) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NayaSportStore()),
                    );
                  } else {
                    _showRegisterFailedAlert(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRegisterFailedAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register Failed'),
          content: Text('Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
