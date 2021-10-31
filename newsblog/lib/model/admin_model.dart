class AdminModel {
    AdminModel({
        this.id,
        this.username,
        this.email,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.v,
    });
    String? id;
    String? username;
    String? email;
    String? password;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );
}