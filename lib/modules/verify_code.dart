import 'package:flutter/material.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final TextEditingController _code = TextEditingController();
  static const codigoFake = "12345";
  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verificación de código'),
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
                decoration: const InputDecoration(
                  hintText: '0000',
                  label: Text('Código de verificación'),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
                controller: _code,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      print('Email: $_code');
                      if (_code.text == codigoFake) {
                        Navigator.pushNamed(context, "/restore");
                      } else {
                        _showAlertDialog(
                            "Código incorrecto, intentalo nuevamente");
                      }
                    },
                    child: const Text('Verificar código')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
