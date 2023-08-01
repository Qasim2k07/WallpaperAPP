import 'package:flutter/material.dart';
import 'package:fluuterui/color_wallpaper_grid.dart';
import 'package:fluuterui/controllers/color_controller.dart';

import 'package:fluuterui/controllers/wallpaper_controller.dart';
import 'package:fluuterui/search_screen.dart';
import 'package:get/get.dart';
import 'Models/latest_wallpaper_model.dart';
import 'custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 18, 26),
          title: const Center(
              child: Text(
            'Latest',
            style: TextStyle(fontSize: 26),
          )),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color.fromARGB(255, 1, 21, 34),
        extendBody: true,
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 80,
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: [
                coloredBox(
                  Colors.black,
                  'black',
                  context,
                ),
                coloredBox(Colors.blue, 'blue', context),
                coloredBox(Colors.green, 'green', context),
                coloredBox(Colors.red, 'red', context),
                coloredBox(Colors.yellow, 'yellow', context),
                coloredBox(Colors.white, 'white', context),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 14, 12),
            child: InkWell(
              onTap: () {
                Get.to(const SearchScreen());
              },
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    color: const Color(0xffe4f5ff),
                    borderRadius: BorderRadius.circular(12)),
                child: const Row(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Icon(
                      Icons.search_outlined,
                      color: Color(0xff094f6e),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(color: Color(0xff094f6e)),
                  )
                ]),
              ),
            ),
          ),
          getUI()
        ]),
      ),
    );
  }

  Widget getUI() {
    return GetBuilder<WallpaperController>(
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
        if (controller.latestWallpapersModel != null) {
          return wallpaperGrid(controller.latestWallpapersModel);
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

  Widget wallpaperGrid(LatestWallpapersModel? latestWallpapersModel) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: latestWallpapersModel?.hits?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 9,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7),
        itemBuilder: (context, index) {
          var wallpaper = latestWallpapersModel?.hits?[index];
          return CustomCard(wallpaper: wallpaper, index: index);
        },
      ),
    );
  }

  Widget coloredBox(
    Color color1,
    String namecolor,
    BuildContext context,
  ) {
    String capitalLetter = namecolor.substring(0, 1);
    namecolor = capitalLetter.toUpperCase() + namecolor.substring(1);
    return Row(
      children: [
        InkWell(
          onTap: () {
            ColorController colorController = Get.find();
            colorController.callColorWallpapers(namecolor.toLowerCase());
            Get.to(Screen2(
              clrnm: namecolor,
            ));
          },
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: color1),
                    borderRadius: BorderRadius.circular(12),
                    color: color1),
              ),
              Container(
                height: 50,
                width: 140,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(
                  7,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.black.withOpacity(0.3)),
                child: Center(
                  child: Text(
                    namecolor,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
