// To parse this JSON data, do
//
//     final countryModel = countryModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CountryModel> countryModelFromMap(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromMap(x)));

String countryModelToMap(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));


//contry model
class CountryModel {
  final int updated;
  final String country;
  final CountryInfo countryInfo;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final String continent;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;

  CountryModel({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
    updated: json["updated"],
    country: json["country"],
    countryInfo: CountryInfo.fromMap(json["countryInfo"]),
    cases: json["cases"],
    todayCases: json["todayCases"],
    deaths: json["deaths"],
    todayDeaths: json["todayDeaths"],
    recovered: json["recovered"],
    todayRecovered: json["todayRecovered"],
    active: json["active"],
    critical: json["critical"],
    casesPerOneMillion: json["casesPerOneMillion"],
    deathsPerOneMillion: json["deathsPerOneMillion"],
    tests: json["tests"],
    testsPerOneMillion: json["testsPerOneMillion"],
    population: json["population"],
    continent: json["continent"],
    oneCasePerPeople: json["oneCasePerPeople"],
    oneDeathPerPeople: json["oneDeathPerPeople"],
    oneTestPerPeople: json["oneTestPerPeople"],
    activePerOneMillion: json["activePerOneMillion"]?.toDouble(),
    recoveredPerOneMillion: json["recoveredPerOneMillion"]?.toDouble(),
    criticalPerOneMillion: json["criticalPerOneMillion"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "updated": updated,
    "country": country,
    "countryInfo": countryInfo.toMap(),
    "cases": cases,
    "todayCases": todayCases,
    "deaths": deaths,
    "todayDeaths": todayDeaths,
    "recovered": recovered,
    "todayRecovered": todayRecovered,
    "active": active,
    "critical": critical,
    "casesPerOneMillion": casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion,
    "tests": tests,
    "testsPerOneMillion": testsPerOneMillion,
    "population": population,
    "continent": continent,
    "oneCasePerPeople": oneCasePerPeople,
    "oneDeathPerPeople": oneDeathPerPeople,
    "oneTestPerPeople": oneTestPerPeople,
    "activePerOneMillion": activePerOneMillion,
    "recoveredPerOneMillion": recoveredPerOneMillion,
    "criticalPerOneMillion": criticalPerOneMillion,
  };
}





//country info model
class CountryInfo {
  int? id;
  String? iso2;
  String? iso3;
  final double lat;
  final double long;
  final String flag;

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    required this.lat,
    required this.long,
    required this.flag,
  });

  factory CountryInfo.fromMap(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"],
    iso2: json["iso2"],
    iso3: json["iso3"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    flag: json["flag"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "iso2": iso2,
    "iso3": iso3,
    "lat": lat,
    "long": long,
    "flag": flag,
  };
}
