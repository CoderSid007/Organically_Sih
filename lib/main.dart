import 'package:farmer/screens/farmerHomeScreen.dart';
import 'package:farmer/screens/retailerRegisterScreen.dart';
import 'package:farmer/screens/startingScreen.dart';
import 'package:farmer/screens/userHomeScreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GroceryHomePage(),
    );
  }
}
