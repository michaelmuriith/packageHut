import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/ui_helpers.dart';

class SocialAuth extends StatelessWidget {
  final Function() google;
  final Function() facebook;
  const SocialAuth({super.key, required this.google, required this.facebook});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: google,
            icon: SvgPicture.asset(
              'assets/svg/google.svg',
              height: 30,
              width: 30,
            ),
          ),
          horizontalSpaceSmall,
          IconButton(
            onPressed: facebook,
            icon: SvgPicture.asset(
              'assets/svg/facebook.svg',
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
