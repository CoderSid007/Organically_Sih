import 'package:farmer/screens/retailerRegisterScreen.dart';
import 'package:farmer/screens/userRegister.dart';
import 'package:flutter/material.dart';



class RetailerLoginPage extends StatefulWidget {
  const RetailerLoginPage({Key? key}) : super(key: key);

  @override
  _RetailerLoginPageState createState() => _RetailerLoginPageState();
}

class _RetailerLoginPageState extends State<RetailerLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('login', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
            _buildTextField('Email id', _emailController),
            SizedBox(height: 16),
            _buildTextField('Password', _passwordController, isPassword: true),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RetailerRegisterPage()),
                              );
                    // Navigate to registration page
                  },
                  child: Text(
                    'Register Now',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            // TextButton(
            //   onPressed: () {
            //     // Handle forgot password
            //   },
            //   child: Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Colors.blue),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _login() {
    // Here you can access the values from the controllers
    print('Phone: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    
    // Implement your login logic here
  }
}