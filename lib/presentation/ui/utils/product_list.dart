import 'package:flutter/material.dart';

const List<Map<String, dynamic>> productList = [
  {
    'imageUrl': 'assets/images/img_7.png',
    'discount': '30% OFF',
    'name': 'Sofa',
    'price': 199.99,
    'oldPrice': 299.99,
    'rating': 4.5,
    'reviews': 120,
  },
  {
    'imageUrl': 'assets/images/img_8.png',
    'discount': '25% OFF',
    'name': 'Chair',
    'price': 79.99,
    'oldPrice': 99.99,
    'rating': 4.0,
    'reviews': 90,
  },
  {
    'imageUrl': 'assets/images/img_10.png',
    'discount': '15% OFF',
    'name': 'Table',
    'price': 149.99,
    'oldPrice': 175.00,
    'rating': 4.8,
    'reviews': 85,
  },
  {
    'imageUrl': 'assets/images/img_11.png',
    'discount': '50% OFF',
    'name': 'Lamp',
    'price': 24.99,
    'oldPrice': 49.99,
    'rating': 4.2,
    'reviews': 200,
  },
  {
    'imageUrl': 'assets/images/img_6.png',
    'discount': '20% OFF',
    'name': 'Carpet',
    'price': 89.99,
    'oldPrice': 110.00,
    'rating': 4.3,
    'reviews': 65,
  },
];



final List<Map<String, dynamic>> categories = [
  {
    'icon': Icons.outdoor_grill,
    'label': 'Outdoor',
    'color': Colors.green[100]
  },
  {
    'icon': Icons.local_laundry_service,
    'label': 'Appliances',
    'color': Colors.blue[100]
  },
  {'icon': Icons.chair, 'label': 'Furniture', 'color': Colors.orange[100]},
  {'icon': Icons.more_horiz, 'label': 'See More', 'color': Colors.grey[200]},
];