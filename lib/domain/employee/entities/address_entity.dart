import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String city;
  final String country;
  final String kecamatan;
  final String kelurahan;
  final String letterAddress;
  final String province;
  final String rt;
  final String rw;
  final String street;
  final String type;
  final String zipcode;

  AddressEntity({
    @required this.city,
    @required this.country,
    @required this.kecamatan,
    @required this.kelurahan,
    @required this.letterAddress,
    @required this.province,
    @required this.rt,
    @required this.rw,
    @required this.street,
    @required this.type,
    @required this.zipcode,
  });

  List<Object> get props => [
        city,
        country,
        kecamatan,
        kelurahan,
        letterAddress,
        province,
        rt,
        rw,
        street,
        type,
        zipcode
      ];

  AddressEntity copyWith(
          {String city,
          String country,
          String kecamatan,
          String kelurahan,
          String letterAddress,
          String province,
          String rt,
          String rw,
          String street,
          String type,
          String zipcode}) =>
      AddressEntity(
        city: city ?? this.city,
        country: country ?? this.country,
        kecamatan: kecamatan ?? this.kecamatan,
        kelurahan: kelurahan ?? this.kelurahan,
        letterAddress: letterAddress ?? this.letterAddress,
        province: province ?? this.province,
        rt: rt ?? this.rt,
        rw: rw ?? this.rw,
        street: street ?? this.street,
        type: type ?? this.type,
        zipcode: zipcode ?? this.zipcode,
      );
}
