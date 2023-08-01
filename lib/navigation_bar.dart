import 'package:flutter/material.dart';
import 'package:fluuterui/favorites_screen.dart';
import 'package:fluuterui/settings.dart';

import 'package:fluuterui/wallpaper_grid.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  final List<Widget> pages = [
    const HomePage(),
    const FavouritesScreen(),
    const Settings()
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: selectedIndex, children: pages),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            iconSize: 30,
            elevation: 20,
            unselectedItemColor: Colors.white,
            selectedItemColor: const Color(0xff96c7d5),
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_outlined),
                label: 'Favorties',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ]));
  }
}
