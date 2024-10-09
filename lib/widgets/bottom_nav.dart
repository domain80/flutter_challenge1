import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 14,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home),
          label: ("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.location),
          label: ("Nearby"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.shopping_cart),
          label: ("Cart"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.user),
          label: ("Profile"),
        ),
      ],
    );
  }
}
