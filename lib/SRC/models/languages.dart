import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class Languages extends Equatable {
  final String iso639_1;
  final String iso639_2;
  final String name;
  final String nativeName;

  Languages({@required this.iso639_1,
  @required this.iso639_2,
  @required this.name,
  @required this.nativeName});

  @override
  List<Object> get props => throw UnimplementedError();


}