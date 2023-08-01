import 'package:flutter/material.dart';
import 'package:fluuterui/controllers/search_controller.dart';

import 'package:get/get.dart';

import 'Models/search_wallpaper_model.dart';
import 'custom_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 21, 34),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 18, 26),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Center(
          child: Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffe4f5ff)),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 11.0),
                  icon: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.search_outlined,
                      color: Color(0xff094f6e),
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Color(0xff094f6e)),
                ),
                onSubmitted: (searchText) {
                  SearchingController searchingController = Get.find();
                  searchingController.callSearchWallpapers(searchText);
                },
              ),
            ),
          ),
          getUI()
        ],
      ),
    );
  }

  Widget getUI() {
    return GetBuilder<SearchingController>(
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
        if (controller.searchWallpaperModel != null) {
          return wallpaperGrid(controller.searchWallpaperModel);
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

  Widget wallpaperGrid(SearchWallpaperModel? searchWallpaperModel) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: searchWallpaperModel?.hits?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 9,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7),
        itemBuilder: (context, index) {
          var wallpaper = searchWallpaperModel?.hits?[index];
          return CustomCard(wallpaper: wallpaper, index: index);
        },
      ),
    );
  }
}
