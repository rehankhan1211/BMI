import 'package:bmi/pages/homepage.dart';
import 'package:bmi/theme/light_model.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const  BMI(),
      theme: lightMode,
    );
  }
}





