import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/ui/common/app_colors.dart';

import 'package:stacked/stacked.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/navbar.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  get selectedIndex => null;

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: const Navbar(),
        body: viewModel.widgetOptions,
        bottomNavigationBar: BottomNav(
          onItemTapped: viewModel.onItemTapped,
          selectedIndex: viewModel.selectedIndex,
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
