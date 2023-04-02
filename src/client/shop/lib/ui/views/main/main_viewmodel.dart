import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:shop/services/data.dart' as data;

import '../../../models/product.dart';

class MainViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<String> get categories => data.categories;

  List<Product> get products => data.products;

  get search => () {};

  filter() {
    notifyListeners();
  }

  void navigetToVendorShop() {
    _navigationService.navigateTo(Routes.vendorshopView);
  }

  void navigetToProductDetail(id) {
    _navigationService.navigateToProductView(productId: id);
  }
}
