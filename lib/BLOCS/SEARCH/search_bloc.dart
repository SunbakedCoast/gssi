

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gssi/BLOCS/SEARCH/search.dart';
import 'package:gssi/SRC/models.dart';
import 'package:gssi/SRC/repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  CountryRepository _countryRepository;

  SearchBloc(CountryRepository countryRepository)
  : assert(countryRepository != null),
  _countryRepository = countryRepository,
  super(SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield SearchState.loading();

    try {
      List<Countries> countries = await _countryRepository.searchResults(event.query);
      print('COUNTRIES RESULT FROM BLOC: $countries');
      yield SearchState.success(countries);
    } catch(error){
      yield SearchState.error(error ?? 'An unknown error has occured');
    }
  }

  
}