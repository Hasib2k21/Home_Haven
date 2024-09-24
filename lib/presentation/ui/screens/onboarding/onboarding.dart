import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_haven/presentation/ui/screens/auth/sign_in_screen.dart';
import 'package:home_haven/presentation/ui/screens/bottom_nav_screen.dart';
import 'package:home_haven/presentation/ui/utils/app_colors.dart';

import '../../utils/onboard_item.dart';
import '../../widget/onboarding/dot_indicator.dart';
import '../../widget/onboarding/onboard_content.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  void changePage(int page) {
    currentPage.value = page;
  }
}

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 14,
              child: PageView.builder(
                itemCount: demoData.length,
                onPageChanged: (value) {
                  controller.changePage(value);
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: demoData[index]["illustration"],
                  title: demoData[index]["title"],
                  text: demoData[index]["text"],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoData.length,
                (index) => Obx(() => DotIndicator(
                    isActive: index == controller.currentPage.value)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                return ElevatedButton(
                  onPressed: controller.currentPage.value == demoData.length - 1
                      ? () {
                         // Get.to(() => const SignInScreen());
                        }
                      : null, // Disable button unless on the last page
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.currentPage.value == demoData.length - 1
                            ? AppColors.themeColor
                            : Colors.grey, // Change color based on page
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Get Started".toUpperCase()),
                );
              }),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

