import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:px/domain/employee/entities/renumer_entity.dart';

class Renumer extends RenumerEntity {
  Renumer({
    @required String currency,
    @required String gross,
    @required int value,
  }) : super(
          currency: currency,
          gross: gross,
          value: value,
        );

  factory Renumer.fromJson(Map<String, dynamic> json) {
    return Renumer(
      currency: json['currency'],
      gross: json['gross'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'currency': currency, 'gross': gross, 'value': value};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
