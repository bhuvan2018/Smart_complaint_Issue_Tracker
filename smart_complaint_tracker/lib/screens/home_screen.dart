import 'package:flutter/material.dart';
import 'package:your_project_name/services/auth_service.dart';
import 'package:your_project_name/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  void logout(BuildContext context) async {
    await authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => logout(context),
          child: Text("Logout"),
        ),
      ),
    );
  }
}
