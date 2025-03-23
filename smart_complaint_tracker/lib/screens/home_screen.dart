import 'package:flutter/material.dart';
import 'package:smart_complaint_tracker/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authService.signOut();
            Navigator.pop(context);
          },
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}