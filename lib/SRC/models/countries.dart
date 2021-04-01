
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gssi/SRC/entities.dart';


class Countries extends Equatable {
  final String name;
  final List<dynamic> topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List<dynamic> callingCodes;
  final String capital;
  final List<dynamic> altSpellings;
  final String region;
  final String subregion;
  final int population;
  final List<dynamic> latlng;
  final String demonym;
  //final double area;
  //final double gini;
  final List<dynamic> timzones;
  final List<dynamic> borders;
  //final Currencies currency;
  //final List<Currency> currencies;
  //final List<Languages> languages;
  final String nativeName;
  final String numericCode;
  final List<dynamic> otherNames;
  final String flag;
  final String cioc;

  Countries(
      {@required this.name,
      @required this.topLevelDomain,
      @required this.alpha2Code,
      @required this.alpha3Code,
      @required this.callingCodes,
      @required this.capital,
      @required this.altSpellings,
      @required this.region,
      @required this.subregion,
      @required this.population,
      @required this.latlng,
      @required this.demonym,
      @required this.timzones,
      @required this.borders,
      //@required this.currency,
      //@required this.languages,
      @required this.nativeName,
      @required this.numericCode,
      @required this.otherNames,
      @required this.flag,
      @required this.cioc});

  static Countries fromEntity(CountriesEntity entity) {
    return Countries(
        name: entity.name,
        topLevelDomain: entity.topLevelDomain,
        alpha2Code: entity.alpha2Code,
        alpha3Code: entity.alpha3Code,
        callingCodes: entity.callingCodes,
        capital: entity.capital,
        altSpellings: entity.altSpellings,
        region: entity.region,
        subregion: entity.subregion,
        population: entity.population,
        latlng: entity.latlng,
        demonym: entity.demonym,
        timzones: entity.timezones,
        borders: entity.borders,
        nativeName: entity.nativeName,
        numericCode: entity.numericCode,
        otherNames: entity.otherNames,
        //currency: entity.currency,
        //languages: entity.languages,
        flag: entity.flag,
        cioc: entity.cioc);
  }

  @override
  List<Object> get props => [
        name,
        topLevelDomain,
        alpha2Code,
        alpha3Code,
        callingCodes,
        capital,
        altSpellings,
        region,
        subregion,
        population,
        latlng,
        demonym,
        timzones,
        borders,
        nativeName,
        numericCode,
        otherNames,
        //currency,
       // languages,
        flag,
        cioc,
      ];
}
