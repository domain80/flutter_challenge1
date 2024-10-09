import 'package:dc1/screens/home.screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Index());

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomeScreen(),
        "/product-detials": (context) => const Text("Product details"),
      },
    );
  }
}
