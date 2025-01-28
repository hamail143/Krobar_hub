import 'package:flutter/material.dart';

class VendorRatingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Ratings'),
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
              'Vendor Ratings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildRatingTile(
                'Supplier Name', 4.5, 90, 'assets/images/star.png'),
            _buildRatingTile(
                'Another Supplier', 0.0, 0, 'assets/images/star.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingTile(
      String name, double rating, int reviews, String imagePath) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
      title: Text(name),
      subtitle: Text('Rating: $rating\nReviews: $reviews'),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
