import 'package:flutter/material.dart';
import 'package:krobar_hub/Screens/Order_tracking.dart';

import 'package:krobar_hub/Screens/SupplierScreen.dart';

import 'package:krobar_hub/Screens/vendorrating.dart'; // Import the VendorRatingsScreen

class VendorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo_1.png', // Use the asset image for the logo
              height: 32, // Adjust the height as needed
            ),
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/profile.png'), // Use local asset
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Vendor Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildListTile(
                context, 'Supplier Profiles', 'View and edit supplier details'),
            _buildListTile(context, 'Purchase Order Tracking',
                'Track purchase orders in real-time'),
            _buildListTile(
                context, 'Vendor Ratings', 'Rate and review your vendors'),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        if (title == 'Supplier Profiles') {
          print('Navigating to Supplier Profiles Screen'); // Debug print
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SupplierProfilesScreen()),
          );
        } else if (title == 'Purchase Order Tracking') {
          print('Navigating to Purchase Order Tracking Screen'); // Debug print
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PurchaseOrderTrackingScreen()),
          );
        } else if (title == 'Vendor Ratings') {
          print('Navigating to Vendor Ratings Screen'); // Debug print
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VendorRatingsScreen()),
          );
        }
        // Handle tap for other list tiles if needed
      },
    );
  }
}
