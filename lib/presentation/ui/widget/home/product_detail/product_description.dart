import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../utils/product_description/product.dart';
import 'color_selector.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sofa',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                '\$${250.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color(0xFF404040),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${125.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color(0xFF404040),
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 8),
              Container(
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
                child: const Text(
                  '50% Off',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          const Wrap(
            spacing: 5,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text('4.9'),
              Text('(256)')
            ],
          ),
          const Gap(10),
          Text(
            'A minimalist chair with a reversible back cushion provides soft support for your back and has two sides to wear.',style: Theme.of(context).textTheme.bodyLarge,),
          const Gap(10),
          Container(
            width: 500,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFE0E0E0),
                ),
              ),
            ),
          ),
          const Gap(10),
          Text(
            'Colors',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Gap(10),
          ColorSelectionGrid(),
          Text(
            'Product Description',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Gap(10),
          Text(
            'Choose a stylish dark color or brighten up your home with '
                'colorful sarongs. The SEEKER armchair has a sleek and modern look'
                ' with two sides that meet at the back – and a waist support for added'
                ' comfort!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}