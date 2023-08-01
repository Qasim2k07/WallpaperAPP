import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WallpaperDetail extends StatefulWidget {
  final String imageUrl;
  final String text;
  final String avatarUrl;
  final int index;
  const WallpaperDetail(
      {super.key,
      required this.imageUrl,
      required this.text,
      required this.avatarUrl,
      required this.index});

  @override
  State<WallpaperDetail> createState() => _WallpaperDetailState();
}

class _WallpaperDetailState extends State<WallpaperDetail> {
  bool lockScreenLoader = false;
  bool homeScreenLoader = false;
  bool bothScreenLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 21, 34),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 18, 26),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: CircleAvatar(
              foregroundImage: NetworkImage(widget.avatarUrl),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: widget.index,
            child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                  ),
                )),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () async {
                        try {
                          setState(() {
                            homeScreenLoader = true;
                          });
                          await AsyncWallpaper.setWallpaper(
                            url: widget.imageUrl,
                            wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                            toastDetails: ToastDetails.success(),
                            errorToastDetails: ToastDetails.error(),
                          ).then((value) {
                            setState(() {
                              homeScreenLoader = false;
                            });
                          });
                        } on PlatformException {
                          Fluttertoast.showToast(
                              msg: "Failed to apply wallpaper");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 199,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            color: const Color.fromARGB(255, 59, 135, 148)
                                .withOpacity(0.9)),
                        child: Center(
                          child: homeScreenLoader == true
                              ? const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator())
                              : const Text(
                                  'Apply To Home Screen',
                                  style: TextStyle(color: Color(0xffe4f5ff)),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () async {
                        try {
                          setState(() {
                            lockScreenLoader = true;
                          });
                          await AsyncWallpaper.setWallpaper(
                            url: widget.imageUrl,
                            wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                            toastDetails: ToastDetails.success(),
                            errorToastDetails: ToastDetails.error(),
                          ).then((value) {
                            setState(() {
                              lockScreenLoader = false;
                            });
                          });
                        } on PlatformException {
                          Fluttertoast.showToast(
                              msg: "Failed to apply wallpaper");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 199,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            color: const Color.fromARGB(255, 59, 135, 148)
                                .withOpacity(0.9)),
                        child: Center(
                          child: lockScreenLoader == true
                              ? const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator())
                              : const Text(
                                  'Apply To Lock Screen',
                                  style: TextStyle(color: Color(0xffe4f5ff)),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () async {
                    try {
                      setState(() {
                        bothScreenLoader = true;
                      });
                      await AsyncWallpaper.setWallpaper(
                        url: widget.imageUrl,
                        wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                        toastDetails: ToastDetails.success(),
                        errorToastDetails: ToastDetails.error(),
                      ).then((value) {
                        setState(() {
                          bothScreenLoader = false;
                        });
                      });
                    } on PlatformException {
                      Fluttertoast.showToast(msg: "Failed to apply wallpaper");
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 199,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        color: const Color.fromARGB(255, 59, 135, 148)
                            .withOpacity(0.9)),
                    child: Center(
                      child: bothScreenLoader == true
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator())
                          : const Text(
                              'Apply To Both Screens',
                              style: TextStyle(color: Color(0xffe4f5ff)),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
