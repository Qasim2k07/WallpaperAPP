// To parse this JSON data, do
//
//     final latestWallpapersModel = latestWallpapersModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

LatestWallpapersModel latestWallpapersModelFromJson(String str) =>
    LatestWallpapersModel.fromJson(json.decode(str));

String latestWallpapersModelToJson(LatestWallpapersModel data) =>
    json.encode(data.toJson());

class LatestWallpapersModel {
  int? total;
  int? totalHits;
  List<Hit>? hits;

  LatestWallpapersModel({
    this.total,
    this.totalHits,
    this.hits,
  });

  factory LatestWallpapersModel.fromJson(Map<String, dynamic> json) =>
      LatestWallpapersModel(
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

class Hit {
  int? id;
  String? pageUrl;
  String? type;
  String? tags;
  String? previewUrl;
  int? previewWidth;
  int? previewHeight;
  String? webformatUrl;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageUrl;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageUrl;

  Hit({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        previewUrl: json["previewURL"],
        previewWidth: json["previewWidth"],
        previewHeight: json["previewHeight"],
        webformatUrl: json["webformatURL"],
        webformatWidth: json["webformatWidth"],
        webformatHeight: json["webformatHeight"],
        largeImageUrl: json["largeImageURL"],
        imageWidth: json["imageWidth"],
        imageHeight: json["imageHeight"],
        imageSize: json["imageSize"],
        views: json["views"],
        downloads: json["downloads"],
        collections: json["collections"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": typeValues.reverse[type],
        "tags": tags,
        "previewURL": previewUrl,
        "previewWidth": previewWidth,
        "previewHeight": previewHeight,
        "webformatURL": webformatUrl,
        "webformatWidth": webformatWidth,
        "webformatHeight": webformatHeight,
        "largeImageURL": largeImageUrl,
        "imageWidth": imageWidth,
        "imageHeight": imageHeight,
        "imageSize": imageSize,
        "views": views,
        "downloads": downloads,
        "collections": collections,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
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
