class NewsModel {
  NewsModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? title;
  String? content;
  String? image;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}