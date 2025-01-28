import 'package:flutter/material.dart';

class SplashscreenWidget extends StatefulWidget {
  @override
  _SplashscreenWidgetState createState() => _SplashscreenWidgetState();
}

class _SplashscreenWidgetState extends State<SplashscreenWidget> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3)); // Adjust the delay as needed
    Navigator.pushReplacementNamed(context, '/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo_1.png', // Replace with your logo asset path
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
