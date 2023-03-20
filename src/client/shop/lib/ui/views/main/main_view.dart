import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 5)),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(left: 8.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: IconButton(
                      onPressed: viewModel.search,
                      icon: SvgPicture.asset('assets/svg/Filter.svg')),
                ),
              ],
            ),
            
          )
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
