import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import 'package:login_page/register.dart';

void main() {
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
