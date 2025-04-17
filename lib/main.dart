import 'package:chat_app/screens/ChatScreen.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:chat_app/screens/SignUpScreen.dart';
import 'package:chat_app/screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      routes: {
        'SplashScreen' : (context)=> SplashScreen(),
        'LoginScreen' :(context)=> LoginScreen(),
        'SignUpScreen' : (context) => SignUpScreen(),
        'ChatScreen' : (context) => ChatScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'SplashScreen',
    );
  }
}

