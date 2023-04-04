import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../widgets/similar_ads.dart';
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
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(children: [
              SizedBox(
                height: 350,
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
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8),
                        height: 110,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              viewModel.product.name,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            AppText(
                              viewModel.product.price.toString(),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: kcPrimaryColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.sms),
                                    label: const Text('Make an offer'),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: ElevatedButton.icon(
                                    onPressed: viewModel.addToCart,
                                    icon: const Icon(Icons.shopping_cart),
                                    label: const Text('Buy now'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    viewModel.product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
              const SizedBox(height: 3),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  //seller info
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "data:image/jpeg;base64,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"),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppText(
                          "Stephen Kamau",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 0,
                        ),
                        AppText(
                          "Joined 2 years ago",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                          height: 0,
                        ),
                        AppText(
                          "Last seen 2 days ago",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 1,
                        ),
                        AppText(
                          "12 views",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const AppText(
                "Similar Ads",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 0,
              ),
              const SizedBox(height: 10),
              SimilarAds(
                viewModel: viewModel,
                products: viewModel.getSimilarProducts(viewModel.product),
              ),
            ]),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel(productId);
}

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
