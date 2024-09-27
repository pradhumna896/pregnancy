// To parse this JSON data, do
//
//     final allCalendarModel = allCalendarModelFromJson(jsonString);

import 'dart:convert';

AllCalendarModel allCalendarModelFromJson(String str) =>
    AllCalendarModel.fromJson(json.decode(str));

String allCalendarModelToJson(AllCalendarModel data) =>
    json.encode(data.toJson());

class AllCalendarModel {
  int? id;
  int? weekNumber;
  String? description;
  DateTime? testDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllCalendarModel({
    this.id,
    this.weekNumber,
    this.description,
    this.testDate,
    this.createdAt,
    this.updatedAt,
  });

  factory AllCalendarModel.fromJson(Map<String, dynamic> json) =>
      AllCalendarModel(
        id: json["id"],
        weekNumber: json["weekNumber"],
        description: json["description"],
        testDate:
            json["testDate"] == null ? null : DateTime.parse(json["testDate"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weekNumber": weekNumber,
        "description": description,
        "testDate": testDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
