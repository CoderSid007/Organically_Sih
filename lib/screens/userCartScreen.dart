import 'package:farmer/screens/userHomeScreen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomerHomePage()),
            );
            // Handle back button press
          },
        ),
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartItem(
              name: 'Pomegranate',
              price: 34,
              quantity: quantity,
              onIncrease: () {
                setState(() {
                  quantity++;
                });
              },
              onDecrease: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
            ),
            const SizedBox(height: 16),
            CartItem(
              name: 'Pomegranate',
              price: 34,
              quantity: quantity,
              onIncrease: () {
                setState(() {
                  quantity++;
                });
              },
              onDecrease: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: (){
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomerHomePage()),
            );
            }, 
            child: Text('Add more items',
                style: TextStyle(color: Colors.blue, fontSize: 16))),
            // const Text(
            //   'Add more items',
            //     style: TextStyle(color: Colors.blue, fontSize: 16)),
            const Divider(),
            TextField(
              decoration: InputDecoration(
                hintText: 'Apply Coupon',
                suffixIcon: TextButton(
                  child: const Text('Apply Coupon'),
                  onPressed: () {
                    // Handle coupon application
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Invoice', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const InvoiceItem(label: 'Original Price', value: '₹100'),
            const InvoiceItem(label: 'Delivery', value: '+₹40', color: Colors.red),
            const InvoiceItem(label: 'GST', value: '+₹18', color: Colors.red),
            const InvoiceItem(label: 'Discount', value: '₹20'),
            const Divider(),
            const InvoiceItem(
              label: 'Total',
              value: '₹138',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Add Delivery Address',
                style: TextStyle(color: Colors.blue, fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Confirm order'),
                onPressed: () {
                  // Handle order confirmation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final int price;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.grey[300],
          // You can replace this with an Image widget for the actual product image
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text('₹$price'),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrease,
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrease,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InvoiceItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  final TextStyle? style;

  const InvoiceItem({
    Key? key,
    required this.label,
    required this.value,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: style?.copyWith(color: color) ?? TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}