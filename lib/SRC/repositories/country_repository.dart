import 'dart:async';
import 'dart:convert';

import '../models.dart';
import '../entities.dart';
import 'package:http/http.dart' as http;

abstract class CountryRepository{
  Future<List<Countries>> loadCountries();
  Future<List<Countries>> searchResults(String query);
}

class CountriesAPI extends CountryRepository{
  List<Countries> countries;
  @override
  Future<List<Countries>> loadCountries() async {
    final response = await http.get('https://restcountries.eu/rest/v2/all');
    
    if(response.statusCode != 200)
      throw Exception('Request failed: ${response.statusCode}');
    try{
      //Iterable parsed = jsonDecode(response.body);
      //print('LIST ${parsed.toString()}');
      //List<Countries> list = parsed.map<Countries>((e) => Countries.fromEntity(CountriesEntity.fromJson(e))).toList();
      //return list;
      //return parsed.map((e) => Countries.fromEntity(CountriesEntity.fromJson(e))).toList();
      
      Iterable list = jsonDecode(response.body);
      print('LIST $list');
      return countries = list.map((country) => Countries.fromEntity(CountriesEntity.fromJson(country)))
      .toList();  
    } catch(error){
      throw Exception(error);
    }
  }




  @override
  Future<List<Countries>> searchResults(String query) async {
   final response = await http.get('https://restcountries.eu/rest/v2/all');
   if(response.statusCode != 200 )
   throw Exception('Request failed: ${response.statusCode}');
   try {
     Iterable list = jsonDecode(response.body);
     print('LIST $list');
     return countries = list.map((country) => Countries.fromEntity(CountriesEntity.fromJson(country)))
     .where((element) => element.name.contains(query))
     .toList();
   } catch(_){
     throw Exception('ERROR PARSING BODY');
   }
  }


}