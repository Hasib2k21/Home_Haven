import 'package:flutter/cupertino.dart';
import 'package:home_haven/presentation/ui/widget/home/product_card.dart';
import '../../utils/product_list.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285, // Set the height directly on SizedBox
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        scrollDirection: Axis.horizontal,
        itemCount: productList.length, // Use the productList from product_data.dart
        itemBuilder: (context, index) {
          final product = productList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}