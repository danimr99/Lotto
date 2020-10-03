import 'package:flutter/material.dart';
import 'package:Lotto/screens/home.dart';

void main() {
  runApp(RandomNumberGenerator());
}

class RandomNumberGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
