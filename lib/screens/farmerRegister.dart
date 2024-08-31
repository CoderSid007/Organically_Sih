// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; // For JSON encoding/decoding
// import 'package:farmer/screens/farmerHomeScreen.dart';
// import 'package:farmer/screens/farmerLogin.dart';

// class FarmerRegistrationForm extends StatefulWidget {
//   @override
//   _FarmerRegistrationFormState createState() => _FarmerRegistrationFormState();
// }

// class _FarmerRegistrationFormState extends State<FarmerRegistrationForm> {
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _aadhaarController = TextEditingController();
//   final _upiController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _aadhaarController.dispose();
//     _upiController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text('Hello Farmer'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildTextField(_nameController, 'Name'),
//             _buildTextField(_phoneController, 'Phone Number'),
//             _buildTextField(_emailController, 'email'),
//             _buildTextField(_passwordController, 'Password', isPassword: true),
//             _buildTextField(_confirmPasswordController, 'Confirm password',
//                 isPassword: true),
//             _buildTextField(_aadhaarController, 'aadhaar_number'),
//             _buildTextField(_upiController, 'UPI Id'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text('Register'),
//               onPressed: _register,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(vertical: 15),
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Already have an account?'),
//                 TextButton(
//                   child:
//                       Text('Login Now', style: TextStyle(color: Colors.blue)),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Farmerlogin(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label,
//       {bool isPassword = false}) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 16.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//         obscureText: isPassword,
//       ),
//     );
//   }

//   void _register() async {
//     if (_passwordController.text != _confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }

//     final response = await http.post(
//       Uri.parse(
//           'https://neonlogicsihbackend-production.up.railway.app/api/v1/farmer/register'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
        
        
//       },

      
//       body: jsonEncode(<String, String>{
//         'name': _nameController.text,
//         'phone': _phoneController.text,
//         'email': _emailController.text,
//         'password': _passwordController.text,
//         'aadhaar_number': _aadhaarController.text,
//         'upi_id': _upiController.text,
//       }),
//     );
//     // debugPrint(response);
//     if (response.statusCode == 200) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => FarmerHomePage(),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registration failed')),
//       );
//     }
//   }
// }












// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; // For JSON encoding/decoding
// import 'package:farmer/screens/farmerHomeScreen.dart';
// import 'package:farmer/screens/farmerLogin.dart'; // Ensure this import is correct

// class FarmerRegistrationForm extends StatefulWidget {
//   @override
//   _FarmerRegistrationFormState createState() => _FarmerRegistrationFormState();
// }

// class _FarmerRegistrationFormState extends State<FarmerRegistrationForm> {
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _aadhaarController = TextEditingController();
//   final _upiController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _aadhaarController.dispose();
//     _upiController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text('Hello Farmer'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildTextField(_nameController, 'Name'),
//             _buildTextField(_phoneController, 'Phone Number'),
//             _buildTextField(_emailController, 'Email'),
//             _buildTextField(_passwordController, 'Password', isPassword: true),
//             _buildTextField(_confirmPasswordController, 'Confirm Password', isPassword: true),
//             _buildTextField(_aadhaarController, 'Aadhaar Number'),
//             _buildTextField(_upiController, 'UPI ID'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text('Register'),
//               onPressed: _register,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black, // Use `primary` instead of `backgroundColor`
//                 foregroundColor: Colors.white, // Use `onPrimary` instead of `foregroundColor`
//                 padding: EdgeInsets.symmetric(vertical: 15),
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Already have an account?'),
//                 TextButton(
//                   child: Text('Login Now', style: TextStyle(color: Colors.blue)),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FarmerHomePage(), // Ensure correct class name
//                       ),
//                     );
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
//           border: OutlineInputBorder(),
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//         obscureText: isPassword,
//       ),
//     );
//   }

//   void _register() async {
//     if (_passwordController.text != _confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }

//     final response = await http.post(
//       Uri.parse('https://neonlogicsihbackend-production.up.railway.app/api/v1/farmer/register'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'name': _nameController.text,
//         'phone': _phoneController.text,
//         'email': _emailController.text,
//         'password': _passwordController.text,
//         'aadhaar_number': _aadhaarController.text,
//         'upi_id': _upiController.text,
//       }),
//     );

//     if (response.statusCode == 200) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => FarmerHomePage(),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registration failed')),
//       );
//     }
//   }
// }


import 'package:farmer/screens/farmerHomeScreen.dart';
import 'package:farmer/screens/farmerLogin.dart';
import 'package:flutter/material.dart';

class FarmerRegistrationForm extends StatefulWidget {
  @override
  _FarmerRegistrationFormState createState() => _FarmerRegistrationFormState();
}

class _FarmerRegistrationFormState extends State<FarmerRegistrationForm> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _aadhaarController = TextEditingController();
  final _upiController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _aadhaarController.dispose();
    _upiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Hello Farmer'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(_nameController, 'Name'),
            _buildTextField(_phoneController, 'Phone Number'),
            _buildTextField(_addressController, 'Address'),
            _buildTextField(_passwordController, 'Password', isPassword: true),
            _buildTextField(_confirmPasswordController, 'Confirm password', isPassword: true),
            _buildTextField(_aadhaarController, 'Aadhaar number'),
            _buildTextField(_upiController, 'UPI Id'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Register'),
              onPressed: (){
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FarmerHomePage()),
                              );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  child: Text('Login Now', style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Farmerlogin()),
                              );
                      
                    // TODO: Implement login navigation
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword,
      ),
    );
  }

  void _register() {
    // TODO: Implement registration logic
    print('Name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('Address: ${_addressController.text}');
    print('Password: ${_passwordController.text}');
    print('Aadhaar: ${_aadhaarController.text}');
    print('UPI: ${_upiController.text}');
  }
}