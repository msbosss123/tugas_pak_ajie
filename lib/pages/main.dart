import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuttonnavbar/pages/home_page.dart';
import 'package:mybuttonnavbar/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getX
    return GetMaterialApp(
      // list all pages here
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => HomePage())
      ],
    );
  }
}
