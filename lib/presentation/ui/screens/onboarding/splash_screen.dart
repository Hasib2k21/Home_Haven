import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_haven/presentation/ui/screens/home/home_screen.dart';
import 'package:home_haven/presentation/ui/utils/app_colors.dart';
import '../../widget/onboarding/app_logo.dart';
import '../bottom_nav_screen.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _movetoNextScreen();
  }

  Future<void> _movetoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() =>BottomNavScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A7F65), Color(0xFF115543)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
