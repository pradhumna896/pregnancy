// To parse this JSON data, do
//
//     final schemeModel = schemeModelFromJson(jsonString);

// SchemeModel schemeModelFromJson(String str) => SchemeModel.fromJson(json.decode(str));
//
// String schemeModelToJson(SchemeModel data) => json.encode(data.toJson());

// class SchemeModel {
//   int? id;
//   String? title;
//   String? description;
//   String? url;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   SchemeModel({
//     this.id,
//     this.title,
//     this.description,
//     this.url,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory SchemeModel.fromJson(Map<String, dynamic> json) => SchemeModel(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "url": url,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//       };
// }


class SchemeModel {
  final String createdAt;
  final String description;
  final String title;
  final String updatedAt;
  final int id;
  final String url;

  SchemeModel({
    required this.createdAt,
    required this.description,
    required this.title,
    required this.updatedAt,
    required this.id,
    required this.url,
  });

  factory SchemeModel.fromJson(Map<String, dynamic> json) {
    return SchemeModel(
      createdAt: json['createdAt'],
      description: json['description'],
      title: json['title'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      url: json['url'],
    );
  }
}


class FaModel {
  final String createdAt;
  final String answer;
  final String updatedAt;
  final int id;
  final String question;

  FaModel({
    required this.createdAt,
    required this.answer,
    required this.updatedAt,
    required this.id,
    required this.question,
  });

  factory FaModel.fromJson(Map<String, dynamic> json) {
    return FaModel(
      createdAt: json['createdAt'],
      answer: json['answer'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      question: json['question'],
    );
  }
}
