import 'dart:convert';

CreateReportModel createReportModelFromJson(String str) =>
    CreateReportModel.fromJson(json.decode(str));

String createReportModelToJson(CreateReportModel data) =>
    json.encode(data.toJson());

class CreateReportModel {
  String type;
  int categoryId;
  String photoUrl;
  String videoUrl;
  String description;
  bool isPublic;

  CreateReportModel({
    required this.type,
    required this.categoryId,
    required this.photoUrl,
    required this.videoUrl,
    required this.description,
    required this.isPublic,
  });

  factory CreateReportModel.fromJson(Map<String, dynamic> json) =>
      CreateReportModel(
        type: json["type"],
        categoryId: json["category_id"],
        photoUrl: json["photo_url"],
        videoUrl: json["video_url"],
        description: json["description"],
        isPublic: json["is_public"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "category_id": categoryId,
        "photo_url": photoUrl,
        "video_url": videoUrl,
        "description": description,
        "is_public": isPublic,
      };
}
