import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permiabilitycontroller/login.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(
    home: MyApp(),
    title: 'UDHYOG 4.0',
    theme: ThemeData(primarySwatch: Colors.cyan),
  ));
}

class MyApp extends StatelessWidget {
  //stateless widget class
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginScreen(); //return to statefullwidget of MyScreen class
  }

  static of(BuildContext context) {}
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
