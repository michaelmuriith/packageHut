import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/button.dart';
import '../../widgets/text_line.dart';
import '../../widgets/auth_two.dart';
import 'register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svg/logo.svg',
                    height: 80,
                    width: 80,
                  ),
                  verticalSpaceMedium,
                  const Text(
                    'Register an account',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  verticalSpaceTiny,
                  const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  const SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Button(
                    name: 'Register',
                    color: kcPrimaryColor,
                    onPressed: () {},
                  ),
                  verticalSpaceMedium,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextLine(
                        width: 300,
                        text: 'Or',
                      ),
                      verticalSpaceSmall,
                      SocialAuth(
                        google: () {},
                        facebook: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      horizontalSpaceSmall,
                      TextButton(
                        onPressed: viewModel.navigateToLogin,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
