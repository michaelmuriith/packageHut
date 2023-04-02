import 'package:flutter/material.dart';

import '../views/main/main_viewmodel.dart';

class Category extends StatelessWidget {
  final MainViewModel viewModel;
  const Category({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          viewModel.categories.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 0 ? 4.0 : 2.0),
            child: InkWell(
              onTap: () => viewModel.filter(),
              child: Chip(
                label: Text(viewModel.categories[index]),
                backgroundColor: Colors.grey[300],
                labelStyle: const TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.w500),
                padding:
                    const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
                elevation: 2.0,
                shadowColor: Colors.grey[60],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
