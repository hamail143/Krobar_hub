import 'package:flutter/material.dart';

class ProductViewScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final ValueNotifier<List<Map<String, dynamic>>> cartItems;

  ProductViewScreen({required this.product, required this.cartItems});

  void _addToCart(BuildContext context) {
    cartItems.value = List.from(cartItems.value)..add(product);
    cartItems.notifyListeners();
    final snackBar = SnackBar(
      content: Text('Added to cart'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    print('Product: $product'); // Debug print
    print('Cart Items: ${cartItems.value}'); // Debug print

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/cart',
                arguments: {'cartItems': cartItems},
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.asset(
                  product['image'],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // Product Title and Rating
              Text(
                product['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    product['rating'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '(${product['reviews']} reviews)',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Product Price and Discount
              Row(
                children: [
                  Text(
                    product['price'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    product['discount'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Text(
                product['originalPrice'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(height: 16),

              // Product Sizes
              Wrap(
                spacing: 8.0,
                children: [
                  for (var size in ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'])
                    ChoiceChip(
                      label: Text(size),
                      selected:
                          size == '7 UK', // You can manage the selected state
                      onSelected: (selected) {
                        // Handle size selection
                      },
                    ),
                ],
              ),
              SizedBox(height: 16),

              // Product Description
              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                product['description'],
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Go to cart" button press
                      Navigator.pushNamed(
                        context,
                        '/cart',
                        arguments: {'cartItems': cartItems},
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF1F68A5), // Set the background color
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: TextStyle(
                          color: Colors.white), // Set the text color to white
                    ),
                    child: Text('Go to cart'),
                  ),
                  ElevatedButton(
                    onPressed: () => _addToCart(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                          0xFF28A745), // Complementary background color (green)
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: TextStyle(
                          color: Colors.white), // Set the text color to white
                    ),
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
