import 'package:flutter/material.dart';

class ListProductPage extends StatefulWidget {
  @override
  _ListProductPageState createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _listProduct() {
    // Here you would typically send the data to a backend or store it locally
    print('Product Name: ${_nameController.text}');
    print('Total Quantity: ${_quantityController.text} kg');
    print('Price per kg: ₹${_priceController.text}');
    
    // Clear the fields after listing
    _nameController.clear();
    _quantityController.clear();
    _priceController.clear();

    // Show a snackbar to confirm the action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product listed successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('List product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Potato',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 16),
            Text('Total quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'enter in kgs',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 16),
            Text('Price per kg', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'enter amount (in rupees)',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('List product'),
                onPressed: _listProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}