import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
      backgroundColor: Colors.green, // Use green for positive messages
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showErrorToast(String message) {
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
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          _showToast(
                              'Congrats! Your account has been created.');
                          Navigator.pushReplacementNamed(context, '/login');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            _showErrorToast(
                                'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            _showErrorToast(
                                'The account already exists for that email.');
                          } else if (e.code == 'invalid-email') {
                            _showErrorToast('Invalid email address.');
                          } else {
                            _showErrorToast('An error occurred: ${e.message}');
                          }
                        }
                      }
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
      ),
    );
  }
}
