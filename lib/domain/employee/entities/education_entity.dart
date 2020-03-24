import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class EducationEntity extends Equatable {
  final String degree;
  final String dicipline;
  final String endDate;
  final String faculty;
  final String schoolName;
  final String startDate;

  EducationEntity({
    @required this.degree,
    @required this.dicipline,
    @required this.endDate,
    @required this.faculty,
    @required this.schoolName,
    @required this.startDate,
  });

  List<Object> get props => [
        degree,
        dicipline,
        endDate,
        faculty,
        schoolName,
        startDate,
      ];

  EducationEntity copyWith({
    String degree,
    String dicipline,
    String endDate,
    String faculty,
    String startDate,
  }) =>
      EducationEntity(
        degree: degree ?? this.degree,
        dicipline: dicipline ?? this.dicipline,
        endDate: endDate ?? this.endDate,
        faculty: faculty ?? this.faculty,
        schoolName: schoolName ?? this.schoolName,
        startDate: startDate ?? this.startDate,
      );
}
