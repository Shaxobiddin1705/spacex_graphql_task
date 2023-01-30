import 'dart:convert';

class ShipsModel {
  ShipsModel({
    required this.data,
  });

  final Data data;

  factory ShipsModel.fromRawJson(String str) => ShipsModel.fromJson(json.decode(str));

  factory ShipsModel.fromJson(Map<String, dynamic> json) => ShipsModel(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    required this.ships,
  });

  final List<Ship> ships;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ships: List<Ship>.from(json["ships"].map((x) => Ship.fromJson(x))),
  );
}

class Ship {
  Ship({
    required this.image,
    required this.homePort,
    required this.model,
    required this.name,
    required this.type,
    required this.yearBuilt,
    required this.roles,
    required this.status,
  });

  final String image;
  final String homePort;
  final String model;
  final String name;
  final String type;
  final int yearBuilt;
  final List<String> roles;
  final String status;

  factory Ship.fromRawJson(String str) => Ship.fromJson(json.decode(str));

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
    image: json["image"] ?? '',
    homePort: json["home_port"] ?? '',
    model: json["model"] ?? '',
    name: json["name"] ?? '',
    type: json["type"] ?? '',
    yearBuilt: json["year_built"] ?? 0,
    roles: List<String>.from(json["roles"].map((x) => x)),
    status: json["status"] ?? '',
  );

}