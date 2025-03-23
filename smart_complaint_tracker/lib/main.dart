import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:smart_complaint_tracker/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Ensure this is included
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // Start with the login screen
    );
  }
}

// Error screen if Firebase fails
// class ErrorApp extends StatelessWidget {
//   final String errorMessage;
//   ErrorApp(this.errorMessage);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Error")),
//         body: Center(
//           child: Text(
//             "Firebase Init Failed:\n$errorMessage",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.red, fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }