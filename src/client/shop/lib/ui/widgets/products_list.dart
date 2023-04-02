import 'package:flutter/material.dart';
import 'package:shop/ui/widgets/product_card.dart';

import '../views/main/main_viewmodel.dart';

class Products extends StatelessWidget {
  final MainViewModel viewModel;
  const Products({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.products.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            viewModel.navigetToProductDetail(viewModel.products[index].id);
          },
          child: ProductCard(
            product: viewModel.products[index],
          ),
        ),
      ),
    );
  }
}
