import 'dart:js';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import 'package:login_page/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter login page',
    theme: ThemeData.dark(),
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'register': (context) => Register()
    },
  ));
}
