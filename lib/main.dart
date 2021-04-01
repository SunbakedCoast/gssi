import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gssi/BLOCS/HOME/home.dart';
import 'package:gssi/BLOCS/SEARCH/search.dart';



import 'PAGES/pages.dart';
import 'SRC/models.dart';
import 'SRC/repository.dart';

///[DEVELOPED IN A SINGLE PAGE ONLY BUT IN MORE PROFFESSIONAL LEVEL IT WILL BE DISSEMINATED WITH DIFFERENT FOLDERS AND CLASSSES]

void main() {
  runApp(RepositoryProvider<CountryRepository>(
      create: (context) => CountriesAPI(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) {
              final _countriesRepository =
                  RepositoryProvider.of<CountryRepository>(context);
              return HomeBloc(_countriesRepository)..add(LoadAllData());
            },
          ),
          BlocProvider<SearchBloc>(
            create: (context){
              final _countriesRepository = RepositoryProvider.of<CountryRepository>(context);
              return SearchBloc(_countriesRepository);
            }
          )
        ],
        child: Gssi(),
      )));
}

// ignore: must_be_immutable
class Gssi extends StatelessWidget {
  List<Countries> countries;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GSSI',
      home: Home()
    );
  }
}

