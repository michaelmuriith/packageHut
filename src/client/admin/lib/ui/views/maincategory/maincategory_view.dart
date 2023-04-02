import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'maincategory_viewmodel.dart';

class MaincategoryView extends StackedView<MaincategoryViewModel> {
  const MaincategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaincategoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MaincategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MaincategoryViewModel();
}
