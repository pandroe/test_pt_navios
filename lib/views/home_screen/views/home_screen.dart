import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../login_screen/views/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';
  final String userEmail;

  const HomeScreen({Key? key, required this.userEmail}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Anda berhasil logout'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Constant constant = Constant(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/profil.png'),
                        radius: constant.size.height * 0.100,
                      ),
                      SizedBox(height: constant.size.height * 0.025),
                      Text(
                        'Hi, ${widget.userEmail}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Constant.fontRegular,
                          color: Color(Constant.witheColorNetral),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constant.size.height * 0.025),
                  ElevatedButton(
                    onPressed: _signOut,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        constant.size.width * 0.250,
                        constant.size.height * 0.030,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Color(Constant.witheColorNetral),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constant.fontSemiSmall,
                        color: Color(Constant.blackColorBase),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
