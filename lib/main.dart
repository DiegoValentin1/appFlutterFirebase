import 'package:diego_administracion_flutter/modules/login.dart';
import 'package:diego_administracion_flutter/modules/register.dart';
import 'package:diego_administracion_flutter/modules/restore_password.dart';
import 'package:diego_administracion_flutter/modules/send_email.dart';
import 'package:diego_administracion_flutter/modules/verify_code.dart';
import 'package:diego_administracion_flutter/navigation/bottom_navigation.dart';
import 'package:diego_administracion_flutter/navigation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';





void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        useMaterial3: true,
      ),
      initialRoute: "/menu",
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/menu": (context) => BottomNavigation(),
        "/sendemail": (context) => const SendEmail(),
        "/verifycode": (context) => const VerifyCode(),
        "/restore": (context) => const RestorePassword(),
      },
    );
  }
}


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login"),
      ),
      body: Center(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

