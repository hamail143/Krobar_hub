import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final double totalPrice;

  CheckoutScreen({required this.totalPrice});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod;

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(height: 16),
              Text(
                'Payment done successfully.',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    ).then((_) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Color(0xFF1F68A5), // Set the background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Total'),
                Text('₹${widget.totalPrice.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentMethod('Cash on Delivery', 'assets/images/COD.png'),
            _buildPaymentMethod('Card Payment', 'assets/images/Card_P.png'),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/logo_1.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: selectedPaymentMethod == null
                    ? null
                    : () {
                        _showPaymentSuccessDialog(context);
                      },
                child: Text('Place Order'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String title, String imagePath) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      trailing: Radio(
        value: title,
        groupValue: selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            selectedPaymentMethod = value;
          });
        },
      ),
    );
  }
}
