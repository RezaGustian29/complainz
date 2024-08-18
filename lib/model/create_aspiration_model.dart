import 'dart:convert';

CreateAspirationModel createAspirationModelFromJson(String str) =>
    CreateAspirationModel.fromJson(json.decode(str));

String createAspirationModelToJson(CreateAspirationModel data) =>
    json.encode(data.toJson());

class CreateAspirationModel {
  String type;
  int categoryId;
  String photoUrl;
  String videoUrl;
  String description;
  bool isPublic;

  CreateAspirationModel({
    required this.type,
    required this.categoryId,
    required this.photoUrl,
    required this.videoUrl,
    required this.description,
    required this.isPublic,
  });

  factory CreateAspirationModel.fromJson(Map<String, dynamic> json) =>
      CreateAspirationModel(
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
