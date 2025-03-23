import 'package:flutter/material.dart';
import 'package:your_project_name/services/auth_service.dart';
import 'package:your_project_name/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void signup() async {
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await authService.signUp(email, password);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup successful! Please login.")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to Login
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup failed. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signup,
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}