import 'package:flutter/material.dart';
import 'package:fluuterui/wallpaper_detail.dart';
import 'package:like_button/like_button.dart';

import 'Models/latest_wallpaper_model.dart';

class CustomCard extends StatefulWidget {
  final Hit? wallpaper;
  final int index;
  const CustomCard({super.key, required this.wallpaper, required this.index});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return customCard(context, widget.index);
  }

  Widget customCard(BuildContext context, int index) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WallpaperDetail(
                        imageUrl: widget.wallpaper?.largeImageUrl ?? "",
                        text: widget.wallpaper?.type ?? "",
                        avatarUrl: widget.wallpaper?.userImageUrl ?? "",
                        index: index,
                      )));
        },
        child: Hero(
          tag: index,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.wallpaper?.largeImageUrl ?? "")),
                borderRadius: const BorderRadius.all(Radius.circular(7))),
          ),
        ),
      ),
      Positioned(
        left: 10,
        right: 10,
        top: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LikeButton(
              likeCount: widget.wallpaper?.likes,
              isLiked: false,
              onTap: (value) async {
                return null;
              },
            ),
          ],
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(
            7,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black.withOpacity(0.5)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                foregroundImage:
                    NetworkImage(widget.wallpaper?.userImageUrl ?? ""),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  widget.wallpaper?.type ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
