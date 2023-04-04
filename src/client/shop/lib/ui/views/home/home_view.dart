import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/drawer.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('My App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
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
