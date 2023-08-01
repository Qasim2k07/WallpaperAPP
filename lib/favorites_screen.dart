import 'package:flutter/material.dart';
import 'package:fluuterui/navigation_bar.dart';
import 'package:fluuterui/utils.dart';
import 'custom_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 21, 34),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 18, 26),
          title: const Center(
              child: Text(
            'Favorite',
            style: TextStyle(fontSize: 26),
          )),
          actions: const [Padding(padding: EdgeInsets.fromLTRB(0, 0, 60, 0))],
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomTabBar()));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: favouriteUi());
  }

  Widget favouriteUi() {
    if (favourites.isEmpty) {
      return const Center(
        child: Text(
          "No favourite items",
          style: TextStyle(
              fontSize: 24,
              color: Color(
                0xff96c7d5,
              )),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(7),
      itemCount: favourites.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6 / 9,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7),
      itemBuilder: (context, index) {
        var wallpaper = favourites[index];
        return CustomCard(wallpaper: wallpaper, index: index);
      },
    );
  }
}
