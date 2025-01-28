import 'package:flutter/material.dart';
import 'package:krobar_hub/Screens/checkout.dart';

class CartScreen extends StatelessWidget {
  final ValueNotifier<List<Map<String, dynamic>>> cartItems;

  CartScreen({required this.cartItems});

  void _removeFromCart(BuildContext context, int index) {
    cartItems.value.removeAt(index);
    cartItems.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black), // Set the text color to white
        ),
        backgroundColor:
            Color.fromARGB(255, 250, 250, 250), // Set the background color
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: cartItems,
        builder: (context, cartItems, child) {
          return cartItems.isEmpty
              ? Center(child: Text('Your cart is empty'))
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return ListTile(
                      leading: Image.asset(
                        item['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['title']),
                      subtitle: Text('Price: ${item['price']}'),
                      trailing: ElevatedButton(
                        onPressed: () => _removeFromCart(context, index),
                        child: Text('Remove'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text color
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: cartItems,
        builder: (context, cartItems, child) {
          final totalPrice = cartItems.fold(
              0.0,
              (sum, item) =>
                  sum + double.parse(item['price'].replaceAll('₹', '')));
          return BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: ₹${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckoutScreen(totalPrice: totalPrice),
                        ),
                      );
                    },
                    child: Text('Checkout'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF1F68A5), // Background color
                      onPrimary: Colors.white, // Text color
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
