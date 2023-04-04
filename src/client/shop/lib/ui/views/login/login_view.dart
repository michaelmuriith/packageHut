import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/button.dart';
import '../../widgets/text_line.dart';
import '../../widgets/auth_two.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/logo.svg',
                height: 100,
                width: 100,
              ),
              verticalSpaceMedium,
              const Text(
                'packageHut',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              verticalSpaceMedium,
              const Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              verticalSpaceMedium,
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
              verticalSpaceSmall,
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              verticalSpaceMedium,
              Button(
                name: 'Login',
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
                  const Text('Don\'t have an account?'),
                  horizontalSpaceSmall,
                  TextButton(
                    onPressed: () {
                      viewModel.navigateToRegister();
                    },
                    child: const Text(
                      'Register',
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
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
