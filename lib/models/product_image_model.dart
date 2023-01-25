import 'dart:convert';

List<ModelProductImg> modelProductImgFromJson(String str) =>
    List<ModelProductImg>.from(
        json.decode(str).map((x) => ModelProductImg.fromJson(x)));

String modelProductImgToJson(List<ModelProductImg> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProductImg {
  ModelProductImg({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory ModelProductImg.fromJson(Map<String, dynamic> json) =>
      ModelProductImg(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
