import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_haven/presentation/ui/widget/home/product_image_slider.dart';
import 'package:home_haven/presentation/ui/widget/home/search_text_field.dart';
import '../../utils/app_colors.dart';
import '../../widget/home/horizontal_product_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(60),
            _buildAppbar(),
            const Gap(12),
            const ProductImageSlider(),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSectionHeader(context),
                  const HorizontalProductListView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildSectionHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Special Offers',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w600, color: AppColors.textHead),
        ),
        TextButton(onPressed: () {}, child: const Text('See All'))
      ],
    );
  }

  //

  Widget _buildAppbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SearchTextField(
                  textEditingController: TextEditingController(),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.notifications_outlined),
            ],
          ),
          const Gap(12),
          const Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Deliver to 3517 W. Gray St. Utica, Penny...',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ],
      ),
    );
  }
}
