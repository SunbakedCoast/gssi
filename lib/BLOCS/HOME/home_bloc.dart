import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gssi/SRC/repository.dart';

import 'home.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final CountryRepository _countriesRepository;
  StreamSubscription _streamSubscription;

  HomeBloc(CountryRepository countryRepository)
  : assert(countryRepository != null),
  _countriesRepository = countryRepository,
  super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is LoadAllData){
      yield* _mapLoadAllDatatoState();
    }
    if(event is DataUpdated){
      yield* _mapDataUpdatedtoState(event);
    }
  }

  Stream<HomeState> _mapLoadAllDatatoState() async* {
    yield HomeLoading();
    try {
      _streamSubscription?.cancel();
      _streamSubscription = _countriesRepository.loadCountries().asStream().listen((countries) { 
        print('countries list: $countries');
        add(DataUpdated(countries));
      });
    } catch(error){
      throw Exception(error);
    }
  }

  Stream<HomeState> _mapDataUpdatedtoState(DataUpdated event) async* {
    print('loaded');
    yield DataLoaded(event.countries);
  }
}