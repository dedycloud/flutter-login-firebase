import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:px/domain/employee/entities/identity_entity.dart';

class Identity extends IdentityEntity {
  Identity({
    @required String expired,
    @required String file,
    @required String number,
    @required String type,
  }) : super(
          expired: expired,
          file: file,
          number: number,
          type: type,
        );

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      expired: json['expired'],
      file: json['file'],
      number: json['number'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'expired': expired, 'file': file, 'number': number, 'type': type};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
