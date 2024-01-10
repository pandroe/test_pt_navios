import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_pt_navios/utils/constant.dart';
import 'package:test_pt_navios/views/home_screen/views/home_screen.dart';
import 'package:test_pt_navios/views/login_screen/views/login_screen.dart';
import 'package:test_pt_navios/views/register_screen/views/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(Constant.blackColorBase),
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(
              userEmail: '',
            ),
      },
    );
  }
}
