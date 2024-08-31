import 'package:farmer/screens/userCartScreen.dart';
import 'package:farmer/screens/userQuickScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Morning', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
              // Handle cart action
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              
              
              // Handle profile action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerSlider(),
            CategorySection(),
            ProductSection(title: 'Fresh out of farm', viewAllAction: () {}),
            ProductSection2(title: 'Get Quickly', viewAllAction: () {}),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('Terms & Condition',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFF3D6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/UserHome2.png', // Replace with actual image URL
                      height: 140,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Hey\nCustomer',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  //       ),
                  //       SizedBox(height: 8),
                  //       Text(
                  //         'Buy directly\nfrom farmer or\nRetailer',
                  //         style: TextStyle(fontSize: 16, color: Colors.brown),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {
                  // Handle view all action
                },
                child: Text('View all', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryChip(name: 'Fruits', icon: '🍌'),
              CategoryChip(name: 'Veggies', icon: '🥕'),
              CategoryChip(name: 'Greens', icon: '🥬'),
              CategoryChip(name: 'Cereals', icon: '🥬'),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String name;
  final String icon;

  CategoryChip({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
        avatar: Text(icon, style: TextStyle(fontSize: 18)),
        label: Text(name),
        backgroundColor: Colors.green.withOpacity(0.1),
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
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: viewAllAction,
                child: Text('View all', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ProductCard(name: 'Tomato', imageUrl: 'assets/images/aalo1.png'),
              ProductCard(
                  name: 'Potato', imageUrl: 'https://example.com/potato.jpg'),
              ProductCard(
                  name: 'Cucumber',
                  imageUrl: 'https://example.com/cucumber.jpg'),
              ProductCard(
                  name: 'Lime', imageUrl: 'https://example.com/lime.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductSection2 extends StatelessWidget {
  final String title;
  final VoidCallback viewAllAction;

  ProductSection2({required this.title, required this.viewAllAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: viewAllAction,
                child: Text('View all', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ProductCard(
                  name: 'Tomato', imageUrl: 'assets/images/tomato.jpg'),
              ProductCard(
                  name: 'Potato', imageUrl: 'assets/images/tomato.jpg'),
              ProductCard(
                  name: 'Cucumber',
                  imageUrl: 'assets/images/tomato.jpg'),
              ProductCard(
                  name: 'Lime', imageUrl: 'assets/images/tomato.jpg'),
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


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CustomerHomePage(),
    Userquickscreen(),
    // Uncomment these lines if you add these screens back
    // FreshScreen(),
    // OrdersScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Quick'),
          // Uncomment these lines if you add these screens back
          // BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Fresh'),
          // BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
        ],
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

