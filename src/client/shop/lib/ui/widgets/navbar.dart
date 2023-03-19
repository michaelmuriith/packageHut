import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svg/Menu.svg',
            ),
            onPressed: () {},
          ),
          const Text(
            'packageHut',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/svg/Notification.svg',
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
