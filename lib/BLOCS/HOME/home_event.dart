import '../../SRC/models.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();
  List<Object> get props => [];
}

class LoadAllData extends HomeEvent{}

class DataUpdated extends HomeEvent{
  final List<Countries> countries;

  const DataUpdated([this.countries = const[]]);

  List<Object> get props => [countries];   
}