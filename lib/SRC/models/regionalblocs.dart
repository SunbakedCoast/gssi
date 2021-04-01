import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class RegionalBlocs extends Equatable{
  final String acronym;
  final String name;
  final List<String> otherAcronyms;
  final List<String> otherNames;

  RegionalBlocs({@required this.acronym,
  @required this.name,
  @required this.otherAcronyms,
  @required this.otherNames});

  @override
  List<Object> get props => throw UnimplementedError();
}