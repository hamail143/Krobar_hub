import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  // Define the colors
  final Color primaryColor = Color(0xFF2067A5); // #2067A5
  final Color blackColor = Color(0xFF000000); // #000000 (black)
  final Color whiteColor = Color(0xFFFFFFFF); // #FFFFFF (white)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor, // Set background color to white
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: blackColor, // Set text color to black
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo_1.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '* We will send you a message to set or reset your new password.',
                  style: TextStyle(
                    color: blackColor, // Set text color to black
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle submit
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor, // Update button color
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: whiteColor), // Update text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
