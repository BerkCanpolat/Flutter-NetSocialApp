import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/splashScreen.dart';
import 'package:flutter_netsocialapp/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: themeData,
    );
  }
}