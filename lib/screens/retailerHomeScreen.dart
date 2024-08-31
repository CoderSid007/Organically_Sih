import 'package:farmer/screens/userCartScreen.dart';
import 'package:flutter/material.dart';



class RetailerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey Retailer', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()),
                              );
                // Handle cart action
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerWidget(),
            ProductSection(title: 'Buy from farmer', viewAllAction: () {}),
            ProductSection(title: 'Sell products', viewAllAction: () {}),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFFFF3D6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.network(
              'https://example.com/retailer-image.png', // Replace with actual image URL
              height: 140,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you a\nRetailer?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                SizedBox(height: 8),
                Text(
                  'Buy directly\nfrom farmer and\nsell easily',
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 16,
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  final String title;
  final VoidCallback viewAllAction;

  ProductSection({required this.title, required this.viewAllAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: viewAllAction,
                child: Text('View', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ProductCard(name: 'Tomato', imageUrl: 'https://example.com/tomato.jpg'),
              ProductCard(name: 'Potato', imageUrl: 'https://example.com/potato.jpg'),
              ProductCard(name: 'Cucumber', imageUrl: 'https://example.com/cucumber.jpg'),
              ProductCard(name: 'Lime', imageUrl: 'https://example.com/lime.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProductCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 4),
          Text(name, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.gavel), label: 'Bidding'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 0,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.green,
      unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}