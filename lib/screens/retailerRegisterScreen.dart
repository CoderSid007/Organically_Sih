import 'package:farmer/screens/retailerHomeScreen.dart';
import 'package:farmer/screens/retailerLogin.dart';
import 'package:farmer/screens/startingScreen.dart';
import 'package:flutter/material.dart';

class RetailerRegisterPage extends StatefulWidget {
  const RetailerRegisterPage({Key? key}) : super(key: key);

  @override
  _RetailerRegisterPageState createState() => _RetailerRegisterPageState();
}

class _RetailerRegisterPageState extends State<RetailerRegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _panCardController = TextEditingController();
  final TextEditingController _upiIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _panCardController.dispose();
    _upiIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Register', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroceryHomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Retailer',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildTextField('Name', _nameController),
                      _buildTextField('Phone Number', _phoneController),
                      _buildTextField('Email Id (optional)', _emailController),
                      _buildTextField('Password', _passwordController,
                          isPassword: true),
                      _buildTextField(
                          'Confirm password', _confirmPasswordController,
                          isPassword: true),
                      _buildTextField('Pan card number', _panCardController),
                      _buildTextField('UPI id', _upiIdController),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle registration
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RetailerHomePage()),
                              );
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? '),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RetailerLoginPage()),
                              );

                              // Handle login navigation
                            },
                            child: Text(
                              'Login Now',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    // Here you can access the values from the controllers
    print('Name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print('Confirm Password: ${_confirmPasswordController.text}');
    print('PAN Card: ${_panCardController.text}');
    print('UPI ID: ${_upiIdController.text}');

    // Implement your registration logic here
  }
}
