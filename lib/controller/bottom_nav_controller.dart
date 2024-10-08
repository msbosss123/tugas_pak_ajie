import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Observasi index dari BottomNavigationBar
  var selectedIndex = 0.obs;

  // Mengganti index menu
  void changeIndexMenu(int index) {
    selectedIndex.value = index;
  }
}
