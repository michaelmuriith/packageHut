import '../models/cart_item.dart';

class CartService {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

void addToCart(product) {
  final existingCartItemIndex = _items.indexWhere((item) => item.id == product.id);

  if (existingCartItemIndex >= 0) {
    _items[existingCartItemIndex].quantity++;
  } else {
    final cartItem = CartItem(
      id: product.id,
      name: product.name,
      price: product.price,
      imageUrl: product.imageUrl,
      quantity: 1,
    );
    _items.add(cartItem);
  }
}



  void updateItem(CartItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    _items[index] = item;
  }

  void addItem(CartItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index == -1) {
      _items.add(item);
    } else {
      _items[index].quantity++;
    }
  }

  void removeItem(CartItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _items.removeAt(index);
    }
  }
}
