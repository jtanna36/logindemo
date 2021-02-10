import 'package:flutter/material.dart';
import 'package:logindemo/Screens/Demo.dart';
import 'package:logindemo/Screens/ExampleDemo.dart';
import 'package:logindemo/Screens/Extra.dart';
import 'package:logindemo/Screens/LoginScreen.dart';
import 'package:logindemo/Screens/SampleDemo.dart';
import 'package:logindemo/Screens/TabDemo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SampleDemo(),
    );
  }
}
