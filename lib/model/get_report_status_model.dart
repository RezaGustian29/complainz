import 'dart:convert';

GetReportStatusModel getReportStatusModelFromJson(String str) =>
    GetReportStatusModel.fromJson(json.decode(str));

String getReportStatusModelToJson(GetReportStatusModel data) =>
    json.encode(data.toJson());

class GetReportStatusModel {
  int id;
  String description;
  String status;

  GetReportStatusModel({
    required this.id,
    required this.description,
    required this.status,
  });

  factory GetReportStatusModel.fromJson(Map<String, dynamic> json) =>
      GetReportStatusModel(
        id: json["id"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status": status,
      };
}
