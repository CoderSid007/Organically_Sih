import 'package:farmer/screens/farmerHomeScreen.dart';
import 'package:flutter/material.dart';

class SellProductsPage extends StatelessWidget {
  final List<ProductItem> products = [
    ProductItem(name: 'Potato', image: 'assets/potato.jpg'),
    ProductItem(name: 'Cucumber', image: 'assets/cucumber.jpg'),
    ProductItem(name: 'Tomato', image: 'assets/tomato.jpg'),
    ProductItem(name: 'Papaya', image: 'assets/papaya.jpg'),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FarmerHomePage()),
                              );
            // Handle back button press
          },
        ),
        title: Text('Sell Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products to sell...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem {
  final String name;
  final String image;

  ProductItem({required this.name, required this.image});
}

class ProductCard extends StatelessWidget {
  final ProductItem product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              product.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Handle add button press
              },
              color: Colors.black,
              iconSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}