import 'package:flutter/material.dart';

class PurchaseOrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Order Tracking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Purchase Order Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildOrderTile('Order #12345', 'ABC Supplier', 'Shipped',
                'assets/images/order1.png'),
            _buildOrderTile(
                'Another Order', 'XYZ', 'XYZ', 'assets/images/order2.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTile(
      String orderId, String supplier, String status, String imagePath) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
      title: Text(orderId),
      subtitle: Text('Supplier: $supplier\nStatus: $status'),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
