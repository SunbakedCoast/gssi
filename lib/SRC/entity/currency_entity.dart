
import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String code;
  final String name;
  final String symbol;

  CurrencyEntity(
    this.code,
    this.name,
    this.symbol
  );

  static CurrencyEntity fromJson(Map<String, dynamic> json){
    return CurrencyEntity(
      json['code'] as String,
      json['name'] as String,
      json['symbol'] as String
    );
  }

  @override
  List<Object> get props => [
    code,
    name,
    symbol
  ];

}