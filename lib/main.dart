import 'package:flutter/material.dart';
import 'package:test_pt_navios/utils/constant.dart';
import 'package:test_pt_navios/views/register_screen/views/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(Constant.blackColorBase),
      ),
      home: RegisterScreen(),
    );
  }
}
