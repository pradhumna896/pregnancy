// To parse this JSON data, do
//
//     final maternityModel = maternityModelFromJson(jsonString);

import 'dart:convert';

MaternityModel maternityModelFromJson(String str) => MaternityModel.fromJson(json.decode(str));

String maternityModelToJson(MaternityModel data) => json.encode(data.toJson());

class MaternityModel {
    int? id;
    String? name;
    int? age;
    String? bmi;
    String? pregnancyRisk;
    DateTime? expectedDateOfDelivery;
    DateTime? lastMenstrualDate;
    DateTime? createdAt;
    DateTime? updatedAt;

    MaternityModel({
        this.id,
        this.name,
        this.age,
        this.bmi,
        this.pregnancyRisk,
        this.expectedDateOfDelivery,
        this.lastMenstrualDate,
        this.createdAt,
        this.updatedAt,
    });

    factory MaternityModel.fromJson(Map<String, dynamic> json) => MaternityModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        bmi: json["bmi"],
        pregnancyRisk: json["pregnancyRisk"],
        expectedDateOfDelivery: json["expectedDateOfDelivery"] == null ? null : DateTime.parse(json["expectedDateOfDelivery"]),
        lastMenstrualDate: json["lastMenstrualDate"] == null ? null : DateTime.parse(json["lastMenstrualDate"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "bmi": bmi,
        "pregnancyRisk": pregnancyRisk,
        "expectedDateOfDelivery": expectedDateOfDelivery?.toIso8601String(),
        "lastMenstrualDate": lastMenstrualDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
