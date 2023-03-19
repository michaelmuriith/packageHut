import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/ui_helpers.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightFraction(context, dividedBy: 11),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/Home.svg',
            ),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/Cart.svg',
            ),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/Heart.svg',
            ),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/User.svg',
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
