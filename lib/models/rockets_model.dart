
import 'dart:convert';

class RocketsModel {
  RocketsModel({
    required this.data,
  });

  final Data data;

  factory RocketsModel.fromRawJson(String str) => RocketsModel.fromJson(json.decode(str));

  factory RocketsModel.fromJson(Map<String, dynamic> json) => RocketsModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    required this.rockets,
  });

  final List<Rocket> rockets;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rockets: List<Rocket>.from(json["rockets"].map((x) => Rocket.fromJson(x))),
  );

}

class Rocket {
  Rocket({
    required this.name,
    required this.company,
    required this.country,
    required this.description,
    required this.firstFlight,
    required this.successRatePct,
    required this.stages,
    required this.height,
    required this.diameter,
    required this.mass,
    required this.firstStage,
    required this.engines, required this.active
  });

  final String name;
  final String company;
  final String country;
  final String description;
  final String firstFlight;
  final int successRatePct;
  final int stages;
  final Diameter height;
  final Diameter diameter;
  final Mass mass;
  final FirstStage firstStage;
  final Engines engines;
  final bool active;

  factory Rocket.fromRawJson(String str) => Rocket.fromJson(json.decode(str));

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    name: json["name"] ?? '',
    company: json["company"] ?? '',
    country: json["country"] ?? '',
    description: json["description"] ?? '',
    firstFlight: json["first_flight"] ?? '',
    successRatePct: json["success_rate_pct"] ?? 0,
    stages: json["stages"] ?? 0,
    active: json["active"] ?? false,
    height: json["height"] != null ? Diameter.fromJson(json["height"]) : Diameter.empty(),
    diameter: json["diameter"] != null ? Diameter.fromJson(json["diameter"]) : Diameter.empty(),
    mass: json["mass"] != null ? Mass.fromJson(json["mass"]) : Mass.empty(),
    firstStage: json["first_stage"] != null ? FirstStage.fromJson(json["first_stage"]) : FirstStage.empty(),
    engines: json["engines"] != null ? Engines.fromJson(json["engines"]) : Engines.empty(),
  );

}

class Diameter {
  Diameter({
    required this.meters,
  });

  final num meters;

  factory Diameter.fromRawJson(String str) => Diameter.fromJson(json.decode(str));

  factory Diameter.empty() => Diameter(meters: 0);

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
    meters: json["meters"] ?? 0,
  );
}

class Engines {
  Engines({
    required this.thrustToWeight,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.engineLossMax,
    required this.propellant1,
    required this.propellant2,
    required this.layout,
    required this.type,
  });

  final num thrustToWeight;
  final Thrust thrustSeaLevel;
  final Thrust thrustVacuum;
  final String engineLossMax;
  final String propellant1;
  final String propellant2;
  final String layout;
  final String type;

  factory Engines.fromRawJson(String str) => Engines.fromJson(json.decode(str));

  factory Engines.empty() => Engines(thrustToWeight: 0, thrustSeaLevel: Thrust.empty(), thrustVacuum: Thrust.empty(),
      engineLossMax: '', propellant1: '', propellant2: '', layout: '', type: '');

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
    thrustToWeight: json["thrust_to_weight"] ?? 0,
    thrustSeaLevel: json["thrust_sea_level"] != null ? Thrust.fromJson(json["thrust_sea_level"]) : Thrust.empty(),
    thrustVacuum: json["thrust_vacuum"] != null ? Thrust.fromJson(json["thrust_vacuum"]) : Thrust.empty(),
    engineLossMax: json["engine_loss_max"] ?? '',
    propellant1: json["propellant_1"] ?? '',
    propellant2: json["propellant_2"] ?? '',
    layout: json["layout"] ?? '',
    type: json["type"] ?? '',
  );

}

class Thrust {
  Thrust({
    required this.kN,
  });

  final int kN;

  factory Thrust.fromRawJson(String str) => Thrust.fromJson(json.decode(str));

  factory Thrust.empty() => Thrust(kN: 0);

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
    kN: json["kN"] ?? 0,
  );
}

class FirstStage {
  FirstStage({
    required this.thrustSeaLevel,
    required this.fuelAmountTons,
    required this.engines,
    required this.reusable,
  });

  final Thrust thrustSeaLevel;
  final num fuelAmountTons;
  final int engines;
  final bool reusable;

  factory FirstStage.fromRawJson(String str) => FirstStage.fromJson(json.decode(str));

  factory FirstStage.empty() => FirstStage(thrustSeaLevel: Thrust.empty(), fuelAmountTons: 0, engines: 0, reusable: false);

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
    thrustSeaLevel: json["thrust_sea_level"] != null ? Thrust.fromJson(json["thrust_sea_level"]) : Thrust.empty(),
    fuelAmountTons: json["fuel_amount_tons"] ?? 0,
    engines: json["engines"] ?? 0,
    reusable: json["reusable"] ?? false,
  );

}

class Mass {
  Mass({
    required this.kg,
  });

  final int kg;

  factory Mass.fromRawJson(String str) => Mass.fromJson(json.decode(str));
  factory Mass.empty() => Mass(kg: 0);
  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
    kg: json["kg"] ?? 0,
  );

}
