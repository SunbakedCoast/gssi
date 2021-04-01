import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Translations extends Equatable{
  final String de;
  final String es;
  final String fr;
  final String ja;
  final String it;
  final String br;
  final String pt;
  final String nl;
  final String hr;
  final String fa;

  Translations({@required this.de,
  @required this.es,
  @required this.fr,
  @required this.ja,
  @required this.it,
  @required this.br,
  @required this.pt,
  @required this.nl,
  @required this.hr,
  @required this.fa});

  

  @override
  List<Object> get props => throw UnimplementedError();

}