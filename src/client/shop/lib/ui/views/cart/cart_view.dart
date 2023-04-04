import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/cart_viewtile.dart';
import 'cart_viewmodel.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: model.cartItems.isEmpty
            ? const Center(
                child: Text('Your cart is empty'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = model.cartItems[index];
                        return CartItemTile(
                          viewModel: model,
                          cartItem: cartItem,
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Total'),
                    trailing: Text('\$${model.totalPrice.toStringAsFixed(2)}'),
                  ),
                  ElevatedButton(
                    onPressed: () => model.navigateToCheckout(),
                    child: const Text('Checkout'),
                  ),
                ],
              ),
      ),
    );
  }
}
