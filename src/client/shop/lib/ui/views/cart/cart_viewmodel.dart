import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  double _total = 0.0;

  double get total => _total = subtotal + shipping;

  double _subtotal = 0.0;
  double get subtotal => () {
        _subtotal = 0.0;
        for (var element in _cart) {
          _subtotal += element.price * element.quantity;
        }
        return _subtotal;
      }();

  double _shipping = 0.0;
  double get shipping => () {
        _shipping = 0.0;
        for (var element in _cart) {
          _shipping += element.price * element.quantity * 0.1;
        }
        return _shipping;
      }();

  get cart => _cart;

  final List<CartItem> _cart = [
    CartItem(
      id: '1',
      name: 'Apple',
      price: 1.99,
      quantity: 1,
      image:
          'https://img.freepik.com/free-photo/basket-full-vegetables_1112-316.jpg?size=626&ext=jpg&ga=GA1.1.799305140.1679347712&semt=sph',
    ),
    CartItem(
      id: '2',
      name: 'Banana',
      price: 1.99,
      quantity: 1,
      image:
          'https://img.freepik.com/free-photo/basket-full-vegetables_1112-316.jpg?size=626&ext=jpg&ga=GA1.1.799305140.1679347712&semt=sph',
    ),
    CartItem(
      id: '3',
      name: 'Orange',
      price: 1.99,
      quantity: 1,
      image:
          'https://img.freepik.com/free-photo/basket-full-vegetables_1112-316.jpg?size=626&ext=jpg&ga=GA1.1.799305140.1679347712&semt=sph',
    ),
    CartItem(
      id: '4',
      name: 'Grapes',
      price: 1.99,
      quantity: 1,
      image:
          'https://img.freepik.com/free-photo/basket-full-vegetables_1112-316.jpg?size=626&ext=jpg&ga=GA1.1.799305140.1679347712&semt=sph',
    ),
    CartItem(
      id: '5',
      name: 'Pineapple',
      price: 1.99,
      quantity: 1,
      image:
          'https://img.freepik.com/free-photo/basket-full-vegetables_1112-316.jpg?size=626&ext=jpg&ga=GA1.1.799305140.1679347712&semt=sph',
    ),
  ];
}

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}
