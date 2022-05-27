import 'dart:convert';

import 'package:flutter/foundation.dart';

class Hospital {
  final String nic;
  final String firstName;
  final String lastName;
  final int dob;
  final String gender;
  final String permenentAddres;
  final String bloodGroup;
  final List longTermIlnesses;
  final List infectipusViraldeseases;
  final int hospitalID;
  Hospital({
    required this.nic,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.permenentAddres,
    required this.bloodGroup,
    required this.longTermIlnesses,
    required this.infectipusViraldeseases,
    required this.hospitalID,
  });

  Hospital copyWith({
    String? nic,
    String? firstName,
    String? lastName,
    int? dob,
    String? gender,
    String? permenentAddres,
    String? bloodGroup,
    List? longTermIlnesses,
    List? infectipusViraldeseases,
    int? hospitalID,
  }) {
    return Hospital(
      nic: nic ?? this.nic,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      permenentAddres: permenentAddres ?? this.permenentAddres,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      longTermIlnesses: longTermIlnesses ?? this.longTermIlnesses,
      infectipusViraldeseases:
          infectipusViraldeseases ?? this.infectipusViraldeseases,
      hospitalID: hospitalID ?? this.hospitalID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nic': nic,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender,
      'permenentAddres': permenentAddres,
      'bloodGroup': bloodGroup,
      'longTermIlnesses': longTermIlnesses,
      'infectipusViraldeseases': infectipusViraldeseases,
      'hospitalID': hospitalID,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      nic: map['nic'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      dob: map['dob']?.toInt() ?? 0,
      gender: map['gender'] ?? '',
      permenentAddres: map['permenentAddres'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      longTermIlnesses: map['longTermIlnesses'] != null
          ? List.from(map['longTermIlnesses'])
          : [],
      infectipusViraldeseases: map['infectipusViraldeseases'] != null
          ? List.from(map['infectipusViraldeseases'])
          : [],
      hospitalID: map['hospitalID']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospital.fromJson(String source) =>
      Hospital.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hospital &&
        other.nic == nic &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dob == dob &&
        other.gender == gender &&
        other.permenentAddres == permenentAddres &&
        other.bloodGroup == bloodGroup &&
        listEquals(other.longTermIlnesses, longTermIlnesses) &&
        listEquals(other.infectipusViraldeseases, infectipusViraldeseases) &&
        other.hospitalID == hospitalID;
  }

  @override
  int get hashCode {
    return nic.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        permenentAddres.hashCode ^
        bloodGroup.hashCode ^
        longTermIlnesses.hashCode ^
        infectipusViraldeseases.hashCode ^
        hospitalID.hashCode;
  }

  @override
  String toString() {
    return 'Hospital(nic: $nic, firstName: $firstName, lastName: $lastName, dob: $dob, gender: $gender, permenentAddres: $permenentAddres, bloodGroup: $bloodGroup, longTermIlnesses: $longTermIlnesses, infectipusViraldeseases: $infectipusViraldeseases, hospitalID: $hospitalID)';
  }
}
