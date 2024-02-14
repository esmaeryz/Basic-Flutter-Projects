import 'package:flutter/material.dart';
import 'package:navbar_example/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomMenu(),
    );
  }
}
