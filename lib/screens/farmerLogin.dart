import 'package:flutter/material.dart';

class Farmerlogin extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Farmerlogin> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Don't have an account? "),
              //     TextButton(
              //       onPressed: () {
              //         // TODO: Navigate to registration screen
              //       },
              //       child: Text(
              //         'Register Now',
              //         style: TextStyle(color: Colors.teal),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 8),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       // TODO: Implement forgot password functionality
              //     },
              //     child: Text(
              //       'Forgot Password',
              //       style: TextStyle(color: Colors.teal),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    // TODO: Implement login logic
    print('Phone: ${_phoneController.text}');
    print('Password: ${_passwordController.text}');
  }
}