import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gssi/BLOCS/HOME/home.dart';
import 'package:gssi/BLOCS/SEARCH/search.dart';
import 'package:gssi/SRC/models.dart';

import 'item.dart';


// ignore: must_be_immutable
class Home extends StatelessWidget {
  List<Countries> countries;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () async {
                  Countries selected = await showSearch<Countries>(
                      context: context,
                      delegate:
                          SearchData(BlocProvider.of<SearchBloc>(context)));
                  print('selected: $selected');
                },
              ),
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is DataLoaded) {
              countries = state.countries;
              print('${state.toString()}');
              return ListView.builder(
                  itemCount: countries.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => _item(
                      context,
                      countries[index].name,
                      countries[index].topLevelDomain,
                      countries[index].alpha2Code,
                      countries[index].alpha3Code,
                      countries[index].callingCodes,
                      countries[index].capital,
                      countries[index].altSpellings,
                      countries[index].region,
                      countries[index].subregion,
                      countries[index].population,
                      countries[index].latlng,
                      countries[index].demonym,
                      countries[index].timzones,
                      countries[index].borders,
                      countries[index].nativeName,
                      countries[index].numericCode,
                      countries[index].otherNames,
                      countries[index].flag,
                      countries[index].cioc));
            }
            return _progressIndicator();
          })),
    );
  }

  Widget _progressIndicator() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _item(
    BuildContext context,
    String name,
    List<dynamic> topLevelDomain,
    String alpha2Code,
    String alpha3Code,
    List<dynamic> callingCodes,
    String capital,
    List<dynamic> altSpellings,
    String region,
    String subregion,
    int population,
    List<dynamic> latlng,
    String demonym,
    List<dynamic> timezones,
    List<dynamic> borders,
    String nativeName,
    String numericCode,
    List<dynamic> otherNames,
    String flag,
    String cioc,
  ) {
    return ListTile(
      ///***[I have sucessfully fetched the images or SVGs but SVG files are failed to render apparently the flutter framework still has problems rendering SVGs see: https://github.com/flutter/flutter/issues/15501?source=post_page---------------------------]
      /*leading: CircleAvatar(
        backgroundImage: NetworkImage(flag), 
      ), */
      title: Text(name),
      subtitle: Text(capital),
      trailing: Text(cioc == null ? 'none' : cioc),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Item(
                  name: name,
                  topLevelDomain: topLevelDomain,
                  alpha2Code: alpha2Code,
                  alpha3Code: alpha3Code,
                  callingCodes: callingCodes,
                  capital: capital,
                  altSpellings: altSpellings,
                  region: region,
                  subregion: subregion,
                  population: population,
                  latlng: latlng,
                  demonym: demonym,
                  timezones: timezones,
                  borders: borders,
                  nativeName: nativeName,
                  numericCode: numericCode,
                  otherNames: otherNames,
                  flag: flag,
                  cioc: cioc))),
    );
  }
}

class SearchData extends SearchDelegate<Countries> {
  final Bloc<SearchEvent, SearchState> countriesBloc;

  SearchData(this.countriesBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    countriesBloc.add(SearchEvent(query));

    return BlocBuilder<SearchBloc, SearchState>(
        cubit: countriesBloc,
        builder: (context, state) {
          if (state.isLoading) return _progressIndicator();
          if (state.hasError) return _error(state.error);

          return ListView.builder(
              itemCount: state.country.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => _item(
                  context,
                      state.country[index].name,
                      state.country[index].topLevelDomain,
                      state.country[index].alpha2Code,
                      state.country[index].alpha3Code,
                      state.country[index].callingCodes,
                      state.country[index].capital,
                      state.country[index].altSpellings,
                      state.country[index].region,
                      state.country[index].subregion,
                      state.country[index].population,
                      state.country[index].latlng,
                      state.country[index].demonym,
                      state.country[index].timzones,
                      state.country[index].borders,
                      state.country[index].nativeName,
                      state.country[index].numericCode,
                      state.country[index].otherNames,
                      state.country[index].flag,
                      state.country[index].cioc));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Widget _item(
    BuildContext context,
    String name,
    List<dynamic> topLevelDomain,
    String alpha2Code,
    String alpha3Code,
    List<dynamic> callingCodes,
    String capital,
    List<dynamic> altSpellings,
    String region,
    String subregion,
    int population,
    List<dynamic> latlng,
    String demonym,
    List<dynamic> timezones,
    List<dynamic> borders,
    String nativeName,
    String numericCode,
    List<dynamic> otherNames,
    String flag,
    String cioc,
  ) {
    return ListTile(
      title: Text(name),
      subtitle: Text(capital),
      trailing: Text(cioc == null ? 'none' : cioc),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Item(
                  name: name,
                  topLevelDomain: topLevelDomain,
                  alpha2Code: alpha2Code,
                  alpha3Code: alpha3Code,
                  callingCodes: callingCodes,
                  capital: capital,
                  altSpellings: altSpellings,
                  region: region,
                  subregion: subregion,
                  population: population,
                  latlng: latlng,
                  demonym: demonym,
                  timezones: timezones,
                  borders: borders,
                  nativeName: nativeName,
                  numericCode: numericCode,
                  otherNames: otherNames,
                  flag: flag,
                  cioc: cioc))),
    );
  }

  Widget _progressIndicator() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _error(String error) => Center(
        child: Text(error),
      );
}
