import 'package:flutter/material.dart';
import '../../models/cart_item.dart';
import '../views/cart/cart_viewmodel.dart';

class CartItemTile extends StatelessWidget {
  final CartViewModel viewModel;
  final CartItem cartItem;
  const CartItemTile({
    Key? key,
    required this.viewModel,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(cartItem.name),
      title: Text('\$${cartItem.price.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => viewModel.decrementQuantity(cartItem),
          ),
          Text(cartItem.quantity.toString()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => viewModel.incrementQuantity(cartItem),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => viewModel.removeFromCart(cartItem),
          ),
        ],
      ),
    );
  }
}
