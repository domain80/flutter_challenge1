import 'dart:ui';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.imageUrl,
  });

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Nike Air Force 1",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "199.99",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
