import 'package:flutter/material.dart';

class SupplierProfilesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplier Profiles'),
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
              'Supplier Profiles',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildSupplierTile('Supplier Name', 'Newyork', '+123 44434 34673',
                'assets/images/supplier.png'),
            _buildSupplierTile(
                'Another Supplier', 'XYZ', 'XYZ', 'assets/images/supplier.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildSupplierTile(
      String name, String location, String contact, String imagePath) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
      title: Text(name),
      subtitle: Text('$location\nContact: $contact'),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
