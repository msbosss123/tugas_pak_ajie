import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuttonnavbar/pages/login_page.dart';
import 'package:mybuttonnavbar/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()), // Halaman Login
        GetPage(name: '/homepage', page: () => HomePage()), // Halaman Utama
      ],
    );
  }
}
