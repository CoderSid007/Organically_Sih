import 'package:farmer/api/api_service.dart';
import 'package:farmer/screens/farmerSellProducts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Import ApiService


class FarmerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Hey farmer'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: 'Eng',
              onChanged: (String? newValue) {
                // Handle language change
              },
              items: <String>['Eng', 'हिंदी', 'தமிழ்']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerWidget(),
            ProductSection(title: 'Sell products', viewAllAction: () {
                // Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => SellProductsPage()),
                //               );
            }),
            ProductSection(title: 'See listed products', viewAllAction: () {}),
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
      
      margin: EdgeInsets.all(30),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: 
            Image.asset('images/farmerhomepage.png')
         
          ),
          // Padding(
          //   padding: EdgeInsets.all(16),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Are you a\nFarmer?',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
          //       SizedBox(height: 8),
          //       Text(
          //         'Sell your\nProducts here',
          //         style: TextStyle(fontSize: 16),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ProductSection extends StatefulWidget {
  final String title;
  final VoidCallback viewAllAction;

  ProductSection({required this.title, required this.viewAllAction});

  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  late Future<List<Map<String, dynamic>>> _products;

  @override
  void initState() {
    super.initState();
    _products = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: widget.viewAllAction, child: Text('View all')),
            ],
          ),
        ),
        Container(
          height: 120,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                final products = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      name: product['name'] ?? 'No name',
                      imageUrl: product['image'] ?? 'https://neonlogicsihbackend-production.up.railway.app/test',
                    );
                  },
                );
              }
            },
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
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Icon(Icons.add_circle, color: Colors.white),
                ),
              ],
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
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.gavel), label: 'Bidding'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.green,
      unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}
