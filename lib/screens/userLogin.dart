// import 'package:flutter/material.dart';



// class UserLoginPage extends StatefulWidget {
//   const UserLoginPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _UserLoginPageState createState() => _UserLoginPageState();
// }

// class _UserLoginPageState extends State<UserLoginPage> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Login',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 40),
//             _buildTextField('Phone Number', _phoneController),
//             SizedBox(height: 16),
//             _buildTextField('Password', _passwordController, isPassword: true),
//             SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 textStyle: TextStyle(fontSize: 18),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don't have an account? "),
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to registration page
//                   },
//                   child: Text(
//                     'Register Now',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Center(
//               child: TextButton(
//                 onPressed: () {
//                   // Handle forgot password
//                 },
//                 child: Text(
//                   'Forgot Password',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         labelText: label,
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }

//   void _login() {
//     // Here you can access the values from the controllers
//     print('Phone: ${_phoneController.text}');
//     print('Password: ${_passwordController.text}');
    
//     // Implement your login logic here
//   }
// }