// To parse this JSON data, do
//
//     final companyInfo = companyInfoFromJson(jsonString);

import 'dart:convert';

class CompanyInfo {
  CompanyInfo({
    required this.data,
  });

  final Data data;

  factory CompanyInfo.fromRawJson(String str) => CompanyInfo.fromJson(json.decode(str));

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    required this.company,
  });

  final Company company;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    company: Company.fromJson(json["company"]),
  );
}

class Company {
  Company({
    required this.ceo,
    required this.coo,
    required this.employees,
    required this.founder,
    required this.testSites,
    required this.founded,
    required this.name,
    required this.summary,
    required this.cto,
    required this.ctoPropulsion,
    required this.headquarters,
    required this.valuation,
    required this.vehicles,
  });

  final String ceo;
  final String coo;
  final int employees;
  final String founder;
  final int testSites;
  final int founded;
  final String name;
  final String summary;
  final String cto;
  final String ctoPropulsion;
  final Headquarters headquarters;
  final int valuation;
  final int vehicles;

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    ceo: json["ceo"] ?? '',
    coo: json["coo"] ?? '',
    employees: json["employees"] ?? 0,
    founder: json["founder"] ?? '',
    testSites: json["test_sites"] ?? 0,
    founded: json["founded"] ?? 0,
    name: json["name"] ?? '',
    summary: json["summary"] ?? '',
    cto: json["cto"] ?? '',
    ctoPropulsion: json["cto_propulsion"] ?? '',
    headquarters: json["headquarters"] != null ? Headquarters.fromJson(json["headquarters"]) : Headquarters.empty(),
    valuation: json["valuation"] ?? 0,
    vehicles: json["vehicles"] ?? 0,
  );
}

class Headquarters {
  Headquarters({
    required this.address,
    required this.city,
    required this.state,
  });

  final String address;
  final String city;
  final String state;

  factory Headquarters.fromRawJson(String str) => Headquarters.fromJson(json.decode(str));

  factory Headquarters.empty() => Headquarters(address: '', city: '', state: '');

  factory Headquarters.fromJson(Map<String, dynamic> json) => Headquarters(
    address: json["address"] ?? '',
    city: json["city"] ?? '',
    state: json["state"] ?? '',
  );

}
