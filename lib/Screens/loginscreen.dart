import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define the colors
  final Color primaryColor = Color(0xFF2067A5); // #2067A5
  final Color blackColor = Color(0xFF000000); // #000000 (black)
  final Color whiteColor = Color(0xFFFFFFFF); // #FFFFFF (white)

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor, // Set background color to white
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome Back!',
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
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Username or Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to Forgot Password screen
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: primaryColor, // Update text color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          Navigator.pushReplacementNamed(context, '/home');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            _showToast('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            _showToast(
                                'Wrong password provided for that user.');
                          } else if (e.code == 'invalid-email') {
                            _showToast('Invalid email address.');
                          } else {
                            _showToast('An error occurred: ${e.message}');
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor, // Update button color
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: whiteColor), // Update text color
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '- OR Continue with -',
                    style: TextStyle(
                      color: blackColor, // Update text color
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
                      // Handle navigate to create account
                      Navigator.pushReplacementNamed(
                          context, '/create_account');
                    },
                    child: Text(
                      'Create An Account Sign Up',
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
      ),
    );
  }
}
