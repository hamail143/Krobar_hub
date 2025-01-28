import 'package:flutter/material.dart';
import 'package:krobar_hub/Screens/Btm.navbar.dart';
import 'package:krobar_hub/Screens/HomeScreen.dart';
import 'package:krobar_hub/Screens/Onboard_one.dart';
import 'package:krobar_hub/Screens/Product_Screen.dart';
import 'package:krobar_hub/Screens/Signup.dart';
import 'package:krobar_hub/Screens/Splash.dart';
import 'package:krobar_hub/Screens/LoginScreen.dart';
import 'package:krobar_hub/Screens/VendorScreen.dart';
import 'package:krobar_hub/Screens/checkout.dart';
import 'package:krobar_hub/Screens/forgotpass.dart';
import 'package:krobar_hub/Screens/tempscreens.dart';
import 'package:krobar_hub/Screens/CartScreen.dart';

// Import the new checkout screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karobar Hub',
      debugShowCheckedModeBanner: false, // Hides the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            SplashscreenWidget(), // Splash screen as the starting screen
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/create_account': (context) => CreateAccountScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/home': (context) => BottomNavBar(), // Use BottomNavBar for home route
        '/vendor': (context) => VendorScreen(),
        '/search': (context) => SearchScreen(),
        '/settings': (context) => SettingsScreen(),
        '/checkout': (context) =>
            CheckoutScreen(totalPrice: 0.0), // Add route for checkout screen
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/cart') {
          final cartItems =
              (settings.arguments as Map<String, dynamic>)['cartItems']
                  as ValueNotifier<List<Map<String, dynamic>>>;
          return MaterialPageRoute(
              builder: (context) => CartScreen(cartItems: cartItems));
        }
        if (settings.name == '/product') {
          final arguments = settings.arguments as Map<String, dynamic>;
          final product = arguments['product'] as Map<String, dynamic>;
          final cartItems = arguments['cartItems']
              as ValueNotifier<List<Map<String, dynamic>>>;
          return MaterialPageRoute(
              builder: (context) =>
                  ProductViewScreen(product: product, cartItems: cartItems));
        }
        return null;
      },
    );
  }
}
