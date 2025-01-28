import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ValueNotifier<List<Map<String, dynamic>>> cartItems;

  HomeScreen({required this.cartItems});

  final List<Map<String, dynamic>> products = List.generate(
      20,
      (index) => {
            'image': 'assets/images/p_view.png',
            'title': 'Product ${index + 1}',
            'description':
                'Neque porro quisquam est qui dolorem ipsum quia dolor...',
            'price': '₹${(Random().nextInt(5000) + 1000)}',
            'discount': '${Random().nextInt(50) + 10}% OFF',
            'originalPrice': '₹${(Random().nextInt(10000) + 2000)}',
            'rating': '${(Random().nextDouble() * 5).toStringAsFixed(1)}',
            'reviews': '${Random().nextInt(100000)}',
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            Image.asset(
              'assets/images/logo_1.png',
              height: 40,
            ),
            CircleAvatar(
              backgroundColor: Colors.red.shade300,
              child: Image.asset(
                'assets/images/profile.png',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/product',
                  arguments: {
                    'product': product,
                    'cartItems': cartItems,
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              product['description'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product['price'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    product['discount'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              product['originalPrice'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                Text(
                                  product['rating'],
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    '(${product['reviews']} reviews)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
