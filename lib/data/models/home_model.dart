import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  String? checkInLast;
  String? checkOutLast;

  HomeModel({
    this.checkInLast,
    this.checkOutLast,
  });

  HomeModel copyWith({
    String? checkInLast,
    String? checkOutLast,
  }) =>
      HomeModel(
        checkInLast: checkInLast ?? this.checkInLast,
        checkOutLast: checkOutLast ?? this.checkOutLast,
      );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        checkInLast: json["CheckInLast"],
        checkOutLast: json["CheckOutLast"],
      );

  Map<String, dynamic> toJson() => {
        "CheckInLast": checkInLast,
        "CheckOutLast": checkOutLast,
      };
}
