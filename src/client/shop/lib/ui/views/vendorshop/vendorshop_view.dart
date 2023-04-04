import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'vendorshop_viewmodel.dart';

class VendorshopView extends StackedView<VendorshopViewModel> {
  const VendorshopView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VendorshopViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  VendorshopViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VendorshopViewModel();
}
