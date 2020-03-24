import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:px/domain/employee/entities/phone_entity.dart';

class Phone extends PhoneEntity {
  Phone({
    @required String type,
    @required String value,
  }) : super(
          type: type,
          value: value,
        );

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
