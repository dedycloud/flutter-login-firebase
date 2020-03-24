import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:px/domain/employee/entities/address_entity.dart';

class Address extends AddressEntity {
  Address({
    @required String city,
    @required String country,
    @required String kecamatan,
    @required String kelurahan,
    @required String letterAddress,
    @required String province,
    @required String rt,
    @required String rw,
    @required String street,
    @required String type,
    @required String zipcode,
  }) : super(
          city: city,
          country: country,
          kecamatan: kecamatan,
          kelurahan: kelurahan,
          letterAddress: letterAddress,
          province: province,
          rt: rt,
          rw: rw,
          street: street,
          type: type,
          zipcode: zipcode,
        );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      country: json['country'],
      kecamatan: json['kecamatan'],
      kelurahan: json['kelurahan'],
      letterAddress: json['letterAddress'],
      province: json['province'],
      rt: json['rt'],
      rw: json['rw'],
      street: json['street'],
      type: json['type'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'letterAddress': letterAddress,
      'province': province,
      'rt': rt,
      'rw': rw,
      'street': street,
      'type': type,
      'zipcode': zipcode
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
