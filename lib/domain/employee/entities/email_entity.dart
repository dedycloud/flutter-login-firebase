import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class EmailEntity extends Equatable {
  final String type;
  final String value;

  EmailEntity({
    @required this.type,
    @required this.value,
  });

  List<Object> get props => [
        type,
        value,
      ];

  EmailEntity copyWith({String type, String valye}) => EmailEntity(
        type: type ?? this.type,
        value: value ?? this.value,
      );
}
