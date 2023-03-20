import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        navItem('assets/svg/Home.svg', 'Home'),
        navItem('assets/svg/Cart.svg', 'Cart'),
        navItem('assets/svg/Heart.svg', 'Favorite'),
        navItem('assets/svg/User.svg', 'Profile'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }

  BottomNavigationBarItem navItem(String icon, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
      ),
      label: label,
    );
  }
}
