// To parse this JSON data, do
//
//     final ColorWallpaperModel = colorWallpaperModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'latest_wallpaper_model.dart';

SearchWallpaperModel searchWallpaperModelFromJson(String str) =>
    SearchWallpaperModel.fromJson(json.decode(str));

String searchWallpaperModelToJson(SearchWallpaperModel data) =>
    json.encode(data.toJson());

class SearchWallpaperModel {
  int? total;
  int? totalHits;
  List<Hit>? hits;

  SearchWallpaperModel({
    this.total,
    this.totalHits,
    this.hits,
  });

  factory SearchWallpaperModel.fromJson(Map<String, dynamic> json) =>
     SearchWallpaperModel(
        total: json["total"],
        totalHits: json["totalHits"],
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalHits,
        "hits": hits == null
            ? []
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

enum Type { ILLUSTRATION, PHOTO, VECTOR_SVG }

final typeValues = EnumValues({
  "illustration": Type.ILLUSTRATION,
  "photo": Type.PHOTO,
  "vector/svg": Type.VECTOR_SVG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
