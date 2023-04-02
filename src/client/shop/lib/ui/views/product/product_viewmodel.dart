import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/product.dart';
import '../../../services/data.dart';

class ProductViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final String productId;
  ProductViewModel(this.productId);

  Product get product =>
      products.firstWhere((element) => element.id == productId);

  void goBack() => _navigationService.back();
}
