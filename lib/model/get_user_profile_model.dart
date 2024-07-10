import 'dart:convert';

/* GetUserProfileModel getUserProfileModelFromJson(String str) =>
    GetUserProfileModel.fromJson(json.decode(str));

String getUserProfileModelToJson(GetUserProfileModel data) =>
    json.encode(data.toJson()); */

class GetUserProfileModel {
  int id;
  String? photo_profile;
  String full_name;
  int laporan;
  int pending;
  int proccess;
  int resolved;

  GetUserProfileModel({
    required this.id,
    this.photo_profile,
    required this.full_name,
    required this.laporan,
    required this.pending,
    required this.proccess,
    required this.resolved,
  });

  factory GetUserProfileModel.fromJson(Map<String, dynamic> json) =>
      GetUserProfileModel(
        id: json['id'],
        photo_profile: json['photo_profile'],
        full_name: json['full_name'],
        laporan: json['laporan'],
        pending: json['pending'],
        proccess: json['proccess'],
        resolved: json['resolved'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_profile": photo_profile,
        "full_name": full_name,
        "laporan": laporan,
        "pending": pending,
        "proccess": proccess,
        "resolved": resolved,
      };
}


/* import 'dart:convert';

GetUserProfileModel getUserProfileModelFromJson(String str) =>
    GetUserProfileModel.fromJson(json.decode(str));

String GetUserProfileModelToJson(GetUserProfileModel data) =>
    json.encode(data.toJson());

class GetUserProfileModel {
  int id;
  String photo_profile;
  String full_name;
  int laporan;
  int pending;
  int proccess;
  int resolved;

  GetUserProfileModel({
    required this.id,
    required this.photo_profile,
    required this.full_name,
    required this.laporan,
    required this.pending,
    required this.proccess,
    required this.resolved,
  });

  factory GetUserProfileModel.fromJson(Map<String, dynamic> json) =>
      GetUserProfileModel(
        id: json['id'],
        photo_profile: json['photo_profile'],
        full_name: json['full_name'],
        laporan: json['laporan'],
        pending: json['pending'],
        proccess: json['proccess'],
        resolved: json['resolved'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_profile": photo_profile,
        "full_name": full_name,
        "laporan": laporan,
        "pending": pending,
        "proccess": proccess,
        "resolved": resolved,
      };
}
 */