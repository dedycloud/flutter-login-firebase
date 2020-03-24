import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class IdentityEntity extends Equatable {
  final String expired;
  final String file;
  final String number;
  final String type;

  IdentityEntity({
    @required this.expired,
    @required this.file,
    @required this.number,
    @required this.type,
  });

  List<Object> get props => [
        expired,
        file,
        number,
        type,
      ];

  IdentityEntity copyWith({
    String expired,
    String file,
    String number,
    String type,
  }) =>
      IdentityEntity(
        expired: expired ?? this.expired,
        file: file ?? this.file,
        number: number ?? this.number,
        type: type ?? this.type,
      );
}
