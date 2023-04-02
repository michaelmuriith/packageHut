import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_text.dart';
import '../../widgets/widget.dart';
import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: ListView(
        children: [
          SearchBar(viewModel: viewModel),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Vendors for you', style: ktsTitle),
          ),
          Category(viewModel: viewModel),
          //add vendor list here
          Products(viewModel: viewModel),
        ],
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
