import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  final String type;
  final String value;

  PhoneEntity({
    @required this.type,
    @required this.value,
  });

  List<Object> get props => [
        type,
        value,
      ];

  PhoneEntity copyWith({String type, String valye}) => PhoneEntity(
        type: type ?? this.type,
        value: value ?? this.value,
      );
}
