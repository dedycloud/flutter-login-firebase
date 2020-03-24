import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class RenumerEntity extends Equatable {
  final String currency;
  final String gross;
  final int value;

  RenumerEntity({
    @required this.currency,
    @required this.gross,
    @required this.value,
  });

  List<Object> get props => [
        currency,
        gross,
        value,
      ];

  RenumerEntity copyWith({
    String currency,
    String gross,
    int value,
  }) =>
      RenumerEntity(
        currency: currency ?? this.currency,
        gross: gross ?? this.gross,
        value: value ?? this.value,
      );
}
