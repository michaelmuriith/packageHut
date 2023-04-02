import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_text.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/product_card.dart';
import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  final String productId;
  const ProductView(this.productId, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(viewModel.product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.white,
                  child: ,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ]),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel(productId);
}
