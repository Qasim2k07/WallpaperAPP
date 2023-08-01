// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluuterui/controllers/wallpaper_controller.dart';
import 'package:fluuterui/navigation_bar.dart';
import 'package:get/get.dart';

import 'controllers/color_controller.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WallpaperController());
    Get.put(ColorController());
    return GetMaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: BottomTabBar());
  }
}
