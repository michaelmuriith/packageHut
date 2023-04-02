import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              ProductCardCenter(product: product),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ProductBtn(
                    name: 'Buy now',
                    icon: Icons.shopping_cart,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 8),
                  ProductBtn(
                    name: 'Chat',
                    icon: Icons.chat,
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProductBtn extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  const ProductBtn({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: color, // set the color of the bottom border
              width: 1.0, // set the width of the bottom border
            ),
          ),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 12,
              color: Colors.black,
            ),
            const SizedBox(width: 4),
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardCenter extends StatelessWidget {
  const ProductCardCenter({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryChip(product: product),
            const SizedBox(height: 8),
            Row(children: const [
              Icon(Icons.pin_drop, size: 9, color: Colors.grey),
              Text('Nairobi, Kenya',
                  style: TextStyle(fontSize: 8, color: Colors.grey))
            ]),
          ],
        ),
        const Spacer(),
        Text(
          'Ksh ${product.price}',
          style: const TextStyle(
            color: Colors.purple,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            product.category,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'paid',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }
}
