import 'package:flutter/material.dart';



class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(name: 'Potato', price: 34, quantity: 1),
    CartItem(name: 'Potato', price: 34, quantity: 1),
  ];

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity)) +
        40 + // Delivery
        18 - // GST
        20; // Discount
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...cartItems.map((item) => CartItemWidget(
                    item: item,
                    onIncrease: () => setState(() => item.quantity++),
                    onDecrease: () => setState(() {
                      if (item.quantity > 1) item.quantity--;
                    }),
                  )),
              SizedBox(height: 16),
              Text('Add more items',
                  style: TextStyle(color: Colors.blue, fontSize: 16)),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter coupon code',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    child: Text('Apply Coupon'),
                    onPressed: () {/* Apply coupon logic */},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Invoice', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              InvoiceItem(label: 'Original Price', value: '₹100'),
              InvoiceItem(label: 'Delivery', value: '+₹40', color: Colors.red),
              InvoiceItem(label: 'GST', value: '+₹18', color: Colors.red),
              InvoiceItem(label: 'Discount', value: '₹20'),
              Divider(),
              InvoiceItem(
                label: 'Total',
                value: '₹${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('See Delivery Instructions',
                  style: TextStyle(color: Colors.blue, fontSize: 16)),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Confirm order'),
                  onPressed: () {/* Confirm order logic */},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final int price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Image.asset('assets/potato.png', width: 60, height: 60),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹${item.price}'),
                Text('Quantity'),
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
                  icon: Icon(Icons.remove),
                  onPressed: onDecrease,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
                Text('${item.quantity}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onIncrease,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
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