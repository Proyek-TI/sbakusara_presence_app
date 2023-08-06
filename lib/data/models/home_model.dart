import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  Check? checkIn;
  Check? checkOut;

  HomeModel({
    this.checkIn,
    this.checkOut,
  });

  HomeModel copyWith({
    Check? checkIn,
    Check? checkOut,
  }) =>
      HomeModel(
        checkIn: checkIn ?? this.checkIn,
        checkOut: checkOut ?? this.checkOut,
      );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        checkIn:
            json["check_in"] == null ? null : Check.fromJson(json["check_in"]),
        checkOut: json["check_out"] == null
            ? null
            : Check.fromJson(json["check_out"]),
      );

  Map<String, dynamic> toJson() => {
        "check_in": checkIn?.toJson(),
        "check_out": checkOut?.toJson(),
      };
}

class Check {
  String? latitude;
  String? longitude;
  String? time;
  String? location;

  Check({
    this.latitude,
    this.longitude,
    this.time,
    this.location,
  });

  Check copyWith({
    String? latitude,
    String? longitude,
    String? time,
    String? location,
  }) =>
      Check(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        time: time ?? this.time,
        location: location ?? this.location,
      );

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        latitude: json["latitude"],
        longitude: json["longitude"],
        time: json["time"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "time": time,
        "location": location,
      };
}
