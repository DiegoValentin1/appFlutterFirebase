import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    /*Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/login');
    });*/
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(user?.uid);
        Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/login');
    });
      } else {
        Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/login');
    });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
