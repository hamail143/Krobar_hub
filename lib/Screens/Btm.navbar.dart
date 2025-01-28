import 'package:flutter/material.dart';
import 'package:krobar_hub/Screens/HomeScreen.dart';
import 'package:krobar_hub/Screens/tempscreens.dart';
import 'package:krobar_hub/Screens/CartScreen.dart';
import 'package:krobar_hub/Screens/VendorScreen.dart'; // Import the correct VendorScreen

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late ValueNotifier<List<Map<String, dynamic>>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = ValueNotifier([]);
  }

  List<Widget> _buildPages() {
    return [
      HomeScreen(cartItems: _cartItems),
      VendorScreen(), // Use the correct VendorScreen
      SearchScreen(),
      SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<List<Map<String, dynamic>>>(
            valueListenable: _cartItems,
            builder: (context, cartItems, child) {
              return _buildPages().elementAt(_selectedIndex);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 0.0), // Adjust the padding to position the FAB
              child: FloatingActionButton(
                elevation: 6.0, // Add elevation
                backgroundColor: Color(0xFF1F68A5),
                onPressed: () {
                  // Handle cart button press
                  Navigator.pushNamed(
                    context,
                    '/cart',
                    arguments: {'cartItems': _cartItems},
                  );
                },
                child: Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    if (_cartItems.value.isNotEmpty)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Center(
                            child: Text(
                              '${_cartItems.value.length}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Vendor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF1F68A5),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true, // Ensure unselected labels are shown
        onTap: _onItemTapped,
      ),
    );
  }
}
