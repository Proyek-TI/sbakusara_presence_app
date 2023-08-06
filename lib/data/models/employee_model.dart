import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  int? id;
  String? name;
  String? role;
  String? username;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  EmployeeModel({
    this.id,
    this.name,
    this.role,
    this.username,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  EmployeeModel copyWith({
    int? id,
    String? name,
    String? role,
    String? username,
    String? email,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      EmployeeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "username": username,
        "email": email,
        "password": password,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
