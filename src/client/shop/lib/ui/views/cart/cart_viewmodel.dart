import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/cart_item.dart';
import '../../../services/cart_service.dart';

class CartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartService>();

  get cartItems => _cartService.items;

  get totalPrice => _totalPrice;

  // The total price of all items in the cart
  double get _totalPrice => _cartService.items
      .fold(0, (sum, item) => sum + item.price * item.quantity);

  // Decrements the quantity of an item in the cart
  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      _cartService.updateItem(item);
      notifyListeners();
    }
  }

  // Increments the quantity of an item in the cart
  void incrementQuantity(CartItem item) {
    item.quantity++;
    _cartService.updateItem(item);
    notifyListeners();
  }

  // Adds an item to the cart
  void addToCart(CartItem item) {
    _cartService.addItem(item);
    notifyListeners();
  }

  // Removes an item from the cart
  void removeFromCart(CartItem item) {
    _cartService.removeItem(item);
    notifyListeners();
  }

  // Navigates to the checkout page
  void navigateToCheckout() {
    _navigationService.navigateTo('/checkout');
  }
}
