class AboutModel {
  final String createdAt;
  final String description;
  final String title;
  final String updatedAt;
  final int id;

  AboutModel({
    required this.createdAt,
    required this.description,
    required this.title,
    required this.updatedAt,
    required this.id,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      createdAt: json['createdAt'],
      description: json['description'],
      title: json['title'],
      updatedAt: json['updatedAt'],
      id: json['id'],
    );
  }
}