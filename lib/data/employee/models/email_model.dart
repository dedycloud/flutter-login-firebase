import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:px/domain/employee/entities/email_entity.dart';

class Email extends EmailEntity {
  Email({
    @required String type,
    @required String value,
  }) : super(type: type, value: value);

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(type: json['type'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'value': value};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
