import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:px/domain/employee/entities/education_entity.dart';

class Education extends EducationEntity {
  Education(
      {@required String degree,
      @required String dicipline,
      @required String endDate,
      @required String faculty,
      @required String schoolName,
      @required String startDate})
      : super(
            degree: degree,
            dicipline: dicipline,
            endDate: endDate,
            faculty: faculty,
            schoolName: schoolName,
            startDate: startDate);

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
        degree: json['degree'],
        dicipline: json['dicipline'],
        endDate: json['endDate'],
        faculty: json['faculty'],
        schoolName: json['schoolName'],
        startDate: json['startDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'degree': degree,
      'dicipline': dicipline,
      'endDate': endDate,
      'faculty': faculty,
      'schoolName': schoolName,
      'startDate': startDate
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
