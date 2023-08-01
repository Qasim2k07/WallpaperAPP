import 'package:flutter/material.dart';

import 'package:fluuterui/controllers/color_controller.dart';

import 'package:get/get.dart';
import 'Models/color_wallpaper_model.dart';
import 'custom_card.dart';

class Screen2 extends StatelessWidget {
  final String clrnm;

  const Screen2({
    super.key,
    required this.clrnm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 18, 26),
        title: Center(
          child: Text(
            '$clrnm Wallpapers',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 1, 35, 39),
      body: Column(
        children: [
          getUI(),
        ],
      ),
    );
  }

  Widget getUI() {
    return GetBuilder<ColorController>(
      builder: (controller) {
        if (controller.loading == true) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (controller.error != null) {
          return const Expanded(
            child: Center(
              child: Text("Error"),
            ),
          );
        }
        if (controller.colorWallpaperModel != null) {
          return wallpaperGrid(controller.colorWallpaperModel);
        }
        return const Expanded(
          child: Center(
            child: Text(
              "API not called",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget wallpaperGrid(ColorWallpaperModel? colorWallpaperModel) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: colorWallpaperModel?.hits?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 9,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7),
        itemBuilder: (context, index) {
          var wallpaper = colorWallpaperModel?.hits?[index];
          return CustomCard(wallpaper: wallpaper, index: index);
        },
      ),
    );
  }
}
