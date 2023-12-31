import 'dart:convert';

List<HistoryOnAdminModel> historyOnAdminModelFromJson(String str) =>
    List<HistoryOnAdminModel>.from(
        json.decode(str).map((x) => HistoryOnAdminModel.fromJson(x)));

String historyOnAdminModelToJson(List<HistoryOnAdminModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryOnAdminModel {
  int? id;
  String? time;
  DateTime? date;
  String? url;
  String? longitude;
  String? latitude;
  String? location;
  String? distance;
  int? status;
  int? userId;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  HistoryOnAdminModel({
    this.id,
    this.time,
    this.date,
    this.url,
    this.longitude,
    this.latitude,
    this.location,
    this.distance,
    this.status,
    this.userId,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  HistoryOnAdminModel copyWith({
    int? id,
    String? time,
    DateTime? date,
    String? url,
    String? longitude,
    String? latitude,
    String? location,
    String? distance,
    int? status,
    int? userId,
    User? user,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      HistoryOnAdminModel(
        id: id ?? this.id,
        time: time ?? this.time,
        date: date ?? this.date,
        url: url ?? this.url,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        location: location ?? this.location,
        distance: distance ?? this.distance,
        status: status ?? this.status,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory HistoryOnAdminModel.fromJson(Map<String, dynamic> json) =>
      HistoryOnAdminModel(
        id: json["id"],
        time: json["Time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        url: json["url"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        location: json["location"],
        distance: json["distance"],
        status: json["status"],
        userId: json["user_id"],
        user: json["User"] == null ? null : User.fromJson(json["User"]),
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
        "Time": time,
        "date": date?.toIso8601String(),
        "url": url,
        "longitude": longitude,
        "latitude": latitude,
        "location": location,
        "distance": distance,
        "status": status,
        "user_id": userId,
        "User": user?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class User {
  int? id;
  String? name;
  String? role;
  String? username;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  User({
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

  User copyWith({
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
      User(
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
