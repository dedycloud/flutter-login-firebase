import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:px/domain/employee/entities/address_entity.dart';
import 'package:px/domain/employee/entities/education_entity.dart';
import 'package:px/domain/employee/entities/identity_entity.dart';
import 'package:px/domain/employee/entities/phone_entity.dart';
import 'package:px/domain/employee/entities/renumer_entity.dart';

class EmployeeEntity extends Equatable {
  final AddressEntity address;
  final String benefit;
  final String birthDate;
  final String birthPlace;
  final int candidateId;
  final String company;
  final EducationEntity education;
  final String emailAddressOffice;
  final String emailAddressPersonal;
  final String firstName;
  final String fullName;
  final String gender;
  final IdentityEntity identity;
  final bool isIntro;
  final bool isSigned;
  final bool isWNA;
  final String jobs;
  final String joinDate;
  final String lastName;
  final String middleName;
  final String onBoardingDate;
  final PhoneEntity phoneNumber;
  final String recruiter;
  final RenumerEntity renumer;

  EmployeeEntity({
    @required this.address,
    @required this.benefit,
    @required this.birthDate,
    @required this.birthPlace,
    @required this.candidateId,
    @required this.company,
    @required this.education,
    @required this.emailAddressOffice,
    @required this.emailAddressPersonal,
    @required this.firstName,
    @required this.fullName,
    @required this.gender,
    @required this.identity,
    @required this.isIntro,
    @required this.isSigned,
    @required this.isWNA,
    @required this.jobs,
    @required this.joinDate,
    @required this.lastName,
    @required this.middleName,
    @required this.onBoardingDate,
    @required this.phoneNumber,
    @required this.recruiter,
    @required this.renumer,
  });

  List<Object> get props => [
        address,
        benefit,
        birthDate,
        birthPlace,
        candidateId,
        company,
        education,
        emailAddressOffice,
        emailAddressPersonal,
        firstName,
        fullName,
        gender,
        identity,
        isIntro,
        isSigned,
        isWNA,
        jobs,
        joinDate,
        lastName,
        middleName,
        onBoardingDate,
        phoneNumber,
        recruiter,
        renumer,
      ];

  EmployeeEntity copyWith({
    AddressEntity address,
    String benefit,
    String birthDate,
    String birthPlace,
    int candidateId,
    String company,
    EducationEntity education,
    String emailAddressOffice,
    String emailAddressPersonal,
    String firstName,
    String fullName,
    String gender,
    IdentityEntity identity,
    bool isNitro,
    bool isSigned,
    bool isWNA,
    String jobs,
    String joinDate,
    String lastName,
    String middleName,
    String onBoardingDate,
    PhoneEntity phoneNumber,
    String recruiter,
    RenumerEntity renumer,
  }) =>
      EmployeeEntity(
        address: address ?? this.address,
        benefit: benefit ?? this.benefit,
        birthDate: birthDate ?? this.birthDate,
        birthPlace: birthPlace ?? this.birthPlace,
        candidateId: candidateId ?? this.candidateId,
        company: company ?? this.company,
        education: education ?? this.education,
        emailAddressOffice: emailAddressOffice ?? this.emailAddressOffice,
        emailAddressPersonal: emailAddressPersonal ?? this.emailAddressPersonal,
        firstName: firstName ?? this.firstName,
        fullName: fullName ?? this.fullName,
        gender: gender ?? this.gender,
        identity: identity ?? this.identity,
        isIntro: isIntro ?? this.isIntro,
        isSigned: isSigned ?? this.isSigned,
        isWNA: isWNA ?? this.isWNA,
        jobs: jobs ?? this.jobs,
        joinDate: joinDate ?? this.joinDate,
        lastName: lastName ?? this.lastName,
        middleName: middleName ?? this.middleName,
        onBoardingDate: onBoardingDate ?? this.onBoardingDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        recruiter: recruiter ?? this.recruiter,
        renumer: renumer ?? this.renumer,
      );
}
