import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
       // Increased height from the original size
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                product['imageUrl'],
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 0,
                top: 101,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFE44949),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    product['discount'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product['name'],
            style: const TextStyle(
              color: Color(0xFF404040),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${product['price'].toStringAsFixed(2)}',
            style: const TextStyle(
              color: Color(0xFF404040),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '\$${product['oldPrice'].toStringAsFixed(2)}',
            style: const TextStyle(
              color: Color(0xFF404040),
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFEAB55A), size: 18),
              const SizedBox(width: 4),
              Text(
                '${product['rating']} (${product['reviews']})',
                style: const TextStyle(
                  color: Color(0xFF404040),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
