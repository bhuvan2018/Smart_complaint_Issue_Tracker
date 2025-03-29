import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 👇 Add Web Client ID (Replace with your actual Web Client ID from Firebase Console)
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: kIsWeb ? "136098645114-09ms5vrh973ra0toca5gtuaidhggevgr.apps.googleusercontent.com" : null, // Only needed for Web
  );

  // ✅ Sign Up with Email & Password
  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-Up Error: ${e.message}");
      return null;
    }
  }

  // ✅ Sign In with Email & Password
  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-In Error: ${e.message}");
      return null;
    }
  }

  // ✅ Sign In with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("❌ Google Sign-In Error: $e");
      return null;
    }
  }

  // ✅ Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print("❌ Sign-Out Error: $e");
    }
  }

  // ✅ Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}