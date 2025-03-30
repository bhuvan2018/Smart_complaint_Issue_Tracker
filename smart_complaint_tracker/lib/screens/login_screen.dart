import 'package:flutter/material.dart';
import 'package:smart_complaint_tracker/services/auth_service.dart';
import 'package:smart_complaint_tracker/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final AuthService _authService = AuthService();
  bool isButtonHovered = false;
  late AnimationController _animationController;
  late Animation<double> _cardAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    
    _cardAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleGoogleSignIn() async {
    final userCredential = await _authService.signInWithGoogle();
    if (userCredential != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Google Sign-In failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2A1A5E), Color(0xFF3A0CA3)], // Enhanced Dark Purple Gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Welcome message with animation
                    FadeTransition(
                      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.0, 0.5, curve: Curves.easeIn),
                        ),
                      ),
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Subtext
                    FadeTransition(
                      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.2, 0.6, curve: Curves.easeIn),
                        ),
                      ),
                      child: Text(
                        "Sign in to continue",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    // Animated Card
                    ScaleTransition(
                      scale: _cardAnimation,
                      child: Container(
                        padding: EdgeInsets.all(28),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withOpacity(0.2)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // App title
                            Text(
                              "Smart Complaint & Issue Tracker",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 16),
                            // App tagline
                            Text(
                              "Your one-stop solution for complaint management and resolution tracking",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: 36),
                            // Google Sign-In Button with hover effect
                            MouseRegion(
                              onEnter: (_) => setState(() => isButtonHovered = true),
                              onExit: (_) => setState(() => isButtonHovered = false),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOutQuint,
                                transform: isButtonHovered 
                                    ? Matrix4.translationValues(0, -5, 0)
                                    : Matrix4.identity(),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _handleGoogleSignIn,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isButtonHovered 
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.95),
                                    foregroundColor: Colors.black87,
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: isButtonHovered ? 8 : 4,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/google_logo.png", height: 24),
                                      SizedBox(width: 12),
                                      Text(
                                        "Sign in with Google",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}