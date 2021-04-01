import '../../SRC/models.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  const HomeState();
  List<Object> get props => [];
}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class DataLoaded extends HomeState{
  final List<Countries> countries;

  const DataLoaded([this.countries = const[]]);

  List<Object> get props => [countries];  
}
