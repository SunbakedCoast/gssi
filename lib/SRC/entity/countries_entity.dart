
import 'package:equatable/equatable.dart';

class CountriesEntity extends Equatable {
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
  final List<dynamic> timezones;
  final List<dynamic> borders;
  //final Currencies currency;
  //final List<Currency> currencies;
  //final List<Languages> languages;
  final String nativeName;
  final String numericCode;
  final List<dynamic> otherNames;
  final String flag;
  final String cioc;

  CountriesEntity(
      this.name,
      this.topLevelDomain,
      this.alpha2Code,
      this.alpha3Code,
      this.callingCodes,
      this.capital,
      this.altSpellings,
      this.region,
      this.subregion,
      this.population,
      this.latlng,
      this.demonym,
      this.timezones,
      this.borders,
     // this.currency,
     // this.languages,
      this.nativeName,
      this.numericCode,
      this.otherNames,
      this.flag,
      this.cioc);

  static CountriesEntity fromJson(Map<String, dynamic> json) {
    return CountriesEntity(
      json['name'] as String,
      json['topLevelDomain'] as List<dynamic>,
      json['alpha2Code'] as String,
      json['alpha3Code']  as String,
      json['callingCodes'] as List<dynamic>,
      json['capital'] as String,
      json['altSpellings'] as List<dynamic>,
      json['region'] as String,
      json['subregion'] as String,
      json['population'] as int,
      json['latlng'] as List<dynamic>,
      json['demonym'] as String,
      json['timezones'] as List<dynamic>,
      json['borders'] as List<dynamic>,
      //Currencies.frocdmEntity(CurrencyEntity.fromJson(json['currencies'])),
     // json['languages'] as List<Languages>,
      json['nativeName'] as String,
      json['numericCode'] as String,
      json['otherNames'] as List<dynamic>,
      json['flag'] as String,
      json['cioc'] as String
      );
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
        timezones,
        borders,
        //currency,
       // languages,
        nativeName, 
        numericCode,
        otherNames,
        flag,
        cioc,
      ];
}
