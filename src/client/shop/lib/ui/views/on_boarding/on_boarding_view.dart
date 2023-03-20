import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shop/ui/common/app_colors.dart';
import 'package:shop/ui/widgets/button.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_text.dart';
import '../../common/ui_helpers.dart';
import 'on_boarding_viewmodel.dart';

class OnBoardingView extends StackedView<OnBoardingViewModel> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnBoardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(alignment: Alignment.center, children: [
            PageView(
              onPageChanged: viewModel.pageChanged,
              children: const [
                OnBoardPage(
                  boardImage: 'assets/images/onboarding/onboard1.png',
                  boardTitle: 'Choose Product',
                  boardDescription:
                      'A product is the item offered for sale. A product can be a service or an item. It can be physical or in virtual or cyber form',
                ),
                OnBoardPage(
                  boardImage: 'assets/images/onboarding/onboard2.png',
                  boardTitle: 'Make Payment',
                  boardDescription:
                      'Payment is the transfer of money services in exchange product or Payments typically made terms agreed ',
                ),
                OnBoardPage(
                  boardImage: 'assets/images/onboarding/onboard3.png',
                  boardTitle: 'Get Your Order',
                  boardDescription:
                      'Business or commerce an order is a stated intention either spoken to engage in a commercial transaction specific products ',
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text((viewModel.currentPage + 1).toString() + '/3'),
                  horizontalSpaceMedium,
                  TextButton(
                    onPressed: () => viewModel.navigateToHome(),
                    child: Text(
                      'Skip',
                      style: ktsSubtitle.copyWith(color: kcPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: viewModel.currentPage != 2
                  ? const Text('')
                  : Button(
                      name: "Get Started",
                      color: kcPrimaryColor,
                      onPressed: viewModel.navigateToHome,
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                dotsCount: 3,
                position: viewModel.currentPage.toDouble(),
                decorator: const DotsDecorator(
                  color: kcLightGrey,
                  activeColor: kcPrimaryColor,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  OnBoardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnBoardingViewModel();
}

class OnBoardPage extends StatelessWidget {
  final String boardImage;
  final String boardTitle;
  final String boardDescription;

  const OnBoardPage({
    Key? key,
    required this.boardImage,
    required this.boardTitle,
    required this.boardDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            boardImage,
            height: 300,
          ),
          verticalSpaceSmall,
          Text(
            boardTitle,
            style: ktsTitle,
          ),
          verticalSpaceSmall,
          Text(
            boardDescription,
            style: ktsSubtitle,
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
