import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/product.dart';
import '../../../services/cart_service.dart';
import '../../../services/data.dart';

class ProductViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartService>();
  final String productId;
  ProductViewModel(this.productId);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  get addToCart => _addToCart;

  // Adds an item to the cart
  void _addToCart() {
    _cartService.addToCart(product);
  }

  Future<void> initialise(String productId) async {
    setBusy(true);
    _isLoading = true;
    notifyListeners();

    // try {
    //   product = await _productService.getProductById(productId);
    // } catch (e) {
    //   // handle error
    // }

    // _isLoading = false;
    // setBusy(false);
    notifyListeners();
  }

  Product get product =>
      products.firstWhere((element) => element.id == productId);

  void goBack() => _navigationService.back();

  List<Product> getSimilarProducts(Product product) {
    return products
        .where((p) => p.category == product.category && p.id != product.id)
        .toList();
  }

  void navigateToProductDetail(String id) {}
}
