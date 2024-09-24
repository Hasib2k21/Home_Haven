import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.categories,
  });

  final List<Map<String, dynamic>> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.9,
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return SizedBox(
          height: 80, // Reduced height
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: category['color'],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(

                children: [
                  Icon(category['icon'], size: 40, color: Colors.black54),
                  const Gap(10),
                  Text(
                    category['label'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
