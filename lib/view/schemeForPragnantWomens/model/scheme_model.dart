// To parse this JSON data, do
//
//     final schemeModel = schemeModelFromJson(jsonString);

import 'dart:convert';

SchemeModel schemeModelFromJson(String str) =>
    SchemeModel.fromJson(json.decode(str));

String schemeModelToJson(SchemeModel data) => json.encode(data.toJson());

class SchemeModel {
  int? id;
  String? title;
  String? description;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;

  SchemeModel({
    this.id,
    this.title,
    this.description,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory SchemeModel.fromJson(Map<String, dynamic> json) => SchemeModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url": url,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
