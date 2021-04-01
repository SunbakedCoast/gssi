import 'package:flutter/material.dart';

class Item extends StatelessWidget{
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
  final String nativeName;
  final String numericCode;
  final List<dynamic> otherNames;
  final String flag;
  final String cioc;

  Item({
    @required this.name,
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
    @required this.timezones,
    @required this.borders,
    @required this.nativeName,
    @required this.numericCode,
    @required this.otherNames,
    @required this.flag,
    @required this.cioc
  });
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(topLevelDomain.toString() ?? 'Field Unavailable'),
              Text(alpha2Code ?? 'Field Unavailable'),
              Text(alpha3Code ?? 'Field Unavailable'),
              Text(callingCodes.toString()),
              Text(capital),
              Text(altSpellings.toString() ?? 'Field Unavailable'),
              Text(region),
              Text(subregion ?? 'Field Unavailable'),
              Text(population.toString()),
              Text(latlng.toString()),
              Text(demonym ?? 'Field Unavailable'),
              Text(timezones.toString() ?? 'Field Unavailable'),
              Text(borders.toString()),
              Text(nativeName ?? 'Field Unavailable'),
              Text(numericCode ?? 'Field Unavailable'),
              Text(otherNames.toString() ?? 'Field Unavailable' ),
              Text(cioc),
            ],
          )
        ),
      ),
    );
  }
}