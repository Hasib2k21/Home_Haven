import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/product_description/product.dart';
import '../../widget/home/product_detail/color_selector.dart';
import '../../widget/home/product_detail/product_image.dart';
import '../../widget/home/product_detail/top_rounded_container.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = demoProducts[0];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  Widget _buildBottomNavbar() {
    return TopRoundedContainer(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 15),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(12),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF156650)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 20,
                  ),
                ),
              ),
              const Gap(15),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add To Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

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
                'colorful sarongs. The EKERÖ armchair has a sleek and modern look'
                ' with two sides that meet at the back – and a waist support for added'
                ' comfort!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
