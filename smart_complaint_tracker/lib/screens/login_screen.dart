import 'package:flutter/material.dart';
import 'package:smart_complaint_tracker/services/auth_service.dart';
import 'package:smart_complaint_tracker/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();

  void _handleGoogleSignIn() async {
    final userCredential = await _authService.signInWithGoogle();
    if (userCredential != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google Sign-In failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleGoogleSignIn,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/icons/google_logo.png", height: 24),
                  SizedBox(width: 10),
                  Text("Sign in with Google"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}