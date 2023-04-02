import '../models/product.dart';

final List<String> categories = [
  'Picked for You',
  'Grocery',
  'Pharmacy',
  'Pet Supplies',
  'Clothing',
  'Home and Garden',
  'Electronics',
  'Beauty and Personal Care',
  'Toys and Games',
  'Sports and Fitness',
  'Stationery and Office Supplies'
];

final List<Product> products = [
  Product(
    id: '1',
    name: 'T-shirt',
    description: 'A comfortable and stylish t-shirt',
    price: 25.0,
    imageUrl:
        'https://images.unsplash.com/photo-1633966887768-64f9a867bdba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=503&q=80',
    category: 'clothing',
  ),
  Product(
    id: '2',
    name: 'Sneakers',
    description: 'A pair of trendy sneakers',
    price: 80.0,
    imageUrl:
        'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
    category: 'footwear',
  ),
  Product(
    id: '3',
    name: 'Backpack',
    description: 'A spacious and durable backpack',
    price: 120.0,
    imageUrl:
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    category: 'accessories',
  ),
  Product(
    id: '4',
    name: 'Jeans',
    description: 'A classic pair of jeans',
    price: 50.0,
    imageUrl:
        'https://images.unsplash.com/photo-1475178626620-a4d074967452?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8amVhbnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    category: 'clothing',
  ),
  Product(
    id: '5',
    name: 'Running shoes',
    description: 'A pair of comfortable running shoes',
    price: 100.0,
    imageUrl:
        'https://images.unsplash.com/photo-1585944672394-4c58a015c1fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    category: 'footwear',
  ),
];

