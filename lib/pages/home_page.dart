import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuttonnavbar/controller/bottom_nav_controller.dart';
import 'package:mybuttonnavbar/pages/menus/home.dart';
import 'package:mybuttonnavbar/pages/menus/history.dart';
import 'package:mybuttonnavbar/pages/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    final List<Widget> menus = [Home(), History(), Profile()];

    return Scaffold(
      body: Obx(() => menus[bottomNavController
          .selectedIndex.value]), // Menonton perubahan nilai selectedIndex
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavController
              .selectedIndex.value, // Menonton perubahan nilai selectedIndex
          onTap: bottomNavController
              .changeIndexMenu, // Memanggil fungsi untuk mengganti indeks
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Beranda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.work_history_outlined), label: "Makanan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profil"),
          ],
        ),
      ),
    );
  }
}
