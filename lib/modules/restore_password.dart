import 'package:flutter/material.dart';

class RestorePassword extends StatefulWidget {
  const RestorePassword({super.key});

  @override
  _RestorePasswordState createState() => _RestorePasswordState();
}

class _RestorePasswordState extends State<RestorePassword> {
  final TextEditingController _password1 = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validación de Contraseñas'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off))),
                controller: _password1,
                obscureText: _isObscure,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Confirmar contraseña'),
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        },
                        icon: Icon(_isObscure2
                            ? Icons.visibility
                            : Icons.visibility_off))),
                controller: _password2,
                obscureText: _isObscure2,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      print('Password: $_password1');
                      if (_password1.text == _password2.text) {
                        _showAlertDialog(
                            "Su contraseña se ha restablecido de forma correcta");
                      } else {
                        _showAlertDialog(
                            "Las contraseñas tienen que coincidir");
                      }
                      //Navigator.pushNamed(context, "sendemail");
                    },
                    child: const Text('Reestablecer contraseña')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
