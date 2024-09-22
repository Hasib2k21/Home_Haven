import 'package:get/get.dart';
import 'package:home_haven/presentation/state_holders/bottom_navbar_controller.dart';
class ControllerBinders extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>BottomNavbarController());
  }

}