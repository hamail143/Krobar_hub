import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
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
                  'Create an account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: blackColor, // Set welcome text color to black
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
                    labelText: 'Username or Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking the ',
                        style: TextStyle(color: blackColor),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' button, you agree to the public offer',
                        style: TextStyle(color: blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle create account
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor, // Update button color
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Create Account'),
                ),
                SizedBox(height: 20),
                Text(
                  '- OR Continue with -',
                  style: TextStyle(
                    color: primaryColor, // Update text color
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Handle Google login
                      },
                      child: Image.asset(
                        'assets/images/Google.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Handle Apple login
                      },
                      child: Image.asset(
                        'assets/images/apples.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Handle Facebook login
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Handle navigate to login
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    'I Already Have an Account Login',
                    style: TextStyle(
                      color: primaryColor, // Update text color
                    ),
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
