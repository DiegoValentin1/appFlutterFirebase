import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final TextEditingController _email = TextEditingController();

  final RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validación de Correo'),
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
  bool validateEmail() {
    String email = _email.text.trim();

    if (!emailRegExp.hasMatch(email)) {
      _showAlertDialog("Por favor, introduce un correo electrónico válido.");
      return false;
    } else {
      // Acción si el correo es válido
      // Fluttertoast.showToast(
      //   msg: "Correo válido.",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      // );
      return true;
    }
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
                decoration: const InputDecoration(
                  hintText: 'Correo Electrónico',
                  label: Text('Correo Electrónico'),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      if (validateEmail()) {
                        Navigator.pushNamed(context, "/verifycode");
                      }
                      print('Email: $_email');
                    },
                    child: const Text('Enviar código')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
