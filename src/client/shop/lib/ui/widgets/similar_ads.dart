import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/ui/widgets/product_card.dart';

import '../views/product/product_viewmodel.dart';

class SimilarAds extends StatelessWidget {
  final ProductViewModel viewModel;
  final List<Product> products;
  const SimilarAds({Key? key, required this.viewModel, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            viewModel.navigateToProductDetail(products[index].id);
          },
          child: ProductCard(
            product: products[index],
          ),
        ),
      ),
    );
  }
}
