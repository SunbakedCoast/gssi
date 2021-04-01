import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gssi/SRC/entity/currency_entity.dart';

class Currencies extends Equatable{
  final String code;
  final String name;
  final String symbol;

  Currencies({@required this.code,
  @required this.name,
  @required this.symbol});


  static Currencies fromEntity(CurrencyEntity entity){
    return Currencies(
      code: entity.code,
      name: entity.name,
      symbol: entity.symbol
    );
  }

  @override
  List<Object> get props => [
    code,
    name,
    symbol
  ];
}