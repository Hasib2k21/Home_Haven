import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_haven/presentation/ui/screens/account/my_account_screen.dart';
import 'package:home_haven/presentation/ui/screens/cart/my_cart_screen.dart';
import '../../state_holders/bottom_navbar_controller.dart';
import 'home/home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavbarController _navbarController =
      Get.find<BottomNavbarController>();

  final List<Widget> _screen = [
    const HomeScreen(),
    const MyCartScreen(),
    const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (_) {
      return Scaffold(

        body: _screen[_navbarController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: _navbarController.selectedIndex,
          onDestinationSelected: _navbarController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'My Cart'),
            NavigationDestination(
                icon: Icon(Icons.person_outline_outlined), label: 'My Account'),
          ],
        ),
      );
    });
  }
}
