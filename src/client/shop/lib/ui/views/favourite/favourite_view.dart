import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'favourite_viewmodel.dart';

class FavouriteView extends StackedView<FavouriteViewModel> {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavouriteViewModel viewModel,
    Widget? child,
  ) {
    return const Center(
      child: Text(
        'FavouriteView',
      ),
    );
  }

  @override
  FavouriteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavouriteViewModel();
}
