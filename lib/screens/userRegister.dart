// // import 'package:farmer/screens/startingScreen.dart';
// // import 'package:farmer/screens/userHomeScreen.dart';
// // import 'package:farmer/screens/userLogin.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';



// // class UserRegisterPage extends StatefulWidget {
// //   const UserRegisterPage({Key? key}) : super(key: key);

// //   @override
// //   _UserRegisterPage createState() => _UserRegisterPage();
// // }

// // class _UserRegisterPage extends State<UserRegisterPage> {
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _phoneController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController = TextEditingController();

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _phoneController.dispose();
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () {
// //             Navigator.push(
// //                     context,
// //                      MaterialPageRoute(builder: (context) => GroceryHomePage()),
// //              );
// //           },
// //         ),
// //         title: Text('Register Here', style: TextStyle(color: Colors.black)),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               _buildTextField('Name', _nameController),
// //               _buildTextField('Phone Number', _phoneController),
// //               _buildTextField('Email id', _emailController),
// //               _buildTextField('Password', _passwordController, isPassword: true),
// //               _buildTextField('Confirm password', _confirmPasswordController, isPassword: true),
// //               SizedBox(height: 24),
// //               // ElevatedButton(
// //               //   onPressed: (){
// //               //     Navigator.push(
// //               //     context,
// //               //     MaterialPageRoute(
// //               //     builder: (context) => CustomerHomePage()),
// //               //     );
// //               //   },
// //               ElevatedButton(
// //                 onPressed: (){
// //                   Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                   builder: (context) => CustomerHomePage()),
// //                   );
// //                 },
// //                 child: Text('Register'),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.black,
// //                   foregroundColor: Colors.white,
// //                   padding: EdgeInsets.symmetric(vertical: 16),
// //                   textStyle: TextStyle(fontSize: 18),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
            
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: TextField(
// //         controller: controller,
// //         obscureText: isPassword,
// //         decoration: InputDecoration(
// //           labelText: label,
// //           filled: true,
// //           fillColor: Colors.grey[200],
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(8),
// //             borderSide: BorderSide.none,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _register() {
// //     // Here you can access the values from the controllers
// //     print('Name: ${_nameController.text}');
// //     print('Phone: ${_phoneController.text}');
// //     print('Email: ${_emailController.text}');
// //     print('Password: ${_passwordController.text}');
// //     print('Confirm Password: ${_confirmPasswordController.text}');
    
// //     // Implement your registration logic here
// //   }
// // }





// import 'package:farmer/screens/farmerHomeScreen.dart';
// import 'package:flutter/material.dart';

// class UserRegistrationScreen extends StatefulWidget {
//   @override
//   _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
// }

// class _RegistrationScreenState extends State<UserRegistrationScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text('Register Here', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildTextField(_nameController, 'Name'),
//             _buildTextField(_phoneController, 'Phone Number'),
//             _buildTextField(_emailController, 'Email Id'),
//             _buildTextField(_passwordController, 'Password', isPassword: true),
//             _buildTextField(_confirmPasswordController, 'Confirm password', isPassword: true),
//             SizedBox(height: 24),
//             ElevatedButton(
//               child: Text('Register'),
//               onPressed: (){
//                  Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => FarmerHomePage()),
//                               );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 textStyle: TextStyle(fontSize: 18),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Already have an account?'),
//                 TextButton(
//                   child: Text('Login Now', style: TextStyle(color: Colors.blue)),
//                   onPressed: () {
//                     // TODO: Navigate to login screen
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false}) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 16.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.grey),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade300),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         obscureText: isPassword,
//       ),
//     );
//   }

//   void _register() {
//     // TODO: Implement registration logic
//     print('Name: ${_nameController.text}');
//     print('Phone: ${_phoneController.text}');
//     print('Email: ${_emailController.text}');
//     print('Password: ${_passwordController.text}');
//     print('Confirm Password: ${_confirmPasswordController.text}');
    
//     // Here you would typically validate the input and send it to your backend
//   }
// }

// // Usage:
// // void main() => runApp(MaterialApp(home: RegistrationScreen()));