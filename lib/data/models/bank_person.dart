import 'dart:convert';

class Bank {
  final String nic;
  final String firstName;
  final String lasttName;
  final String dob;
  final String gender;
  final String permenentAddres;
  final int existingNumberOfLoans;
  final int currentLoanAmount;
  final int blackListedInCRIB;
  Bank({
    required this.nic,
    required this.firstName,
    required this.lasttName,
    required this.dob,
    required this.gender,
    required this.permenentAddres,
    required this.existingNumberOfLoans,
    required this.currentLoanAmount,
    required this.blackListedInCRIB,
  });

  Bank copyWith({
    String? nic,
    String? firstName,
    String? lasttName,
    String? dob,
    String? gender,
    String? permenentAddres,
    int? existingNumberOfLoans,
    int? currentLoanAmount,
    int? blackListedInCRIB,
  }) {
    return Bank(
      nic: nic ?? this.nic,
      firstName: firstName ?? this.firstName,
      lasttName: lasttName ?? this.lasttName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      permenentAddres: permenentAddres ?? this.permenentAddres,
      existingNumberOfLoans:
          existingNumberOfLoans ?? this.existingNumberOfLoans,
      currentLoanAmount: currentLoanAmount ?? this.currentLoanAmount,
      blackListedInCRIB: blackListedInCRIB ?? this.blackListedInCRIB,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nic': nic,
      'firstName': firstName,
      'lasttName': lasttName,
      'dob': dob,
      'gender': gender,
      'permenentAddres': permenentAddres,
      'existingNumberOfLoans': existingNumberOfLoans,
      'currentLoanAmount': currentLoanAmount,
      'blackListedInCRIB': blackListedInCRIB,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      nic: map['nic'] ?? '',
      firstName: map['firstName'] ?? '',
      lasttName: map['lasttName'] ?? '',
      dob: map['dob'] ?? '',
      gender: map['gender'] ?? '',
      permenentAddres: map['permenentAddres'] ?? '',
      existingNumberOfLoans: map['existingNumberOfLoans']?.toInt() ?? 0,
      currentLoanAmount: map['currentLoanAmount']?.toInt() ?? 0,
      blackListedInCRIB: map['blackListedInCRIB']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Bank(nic: $nic, firstName: $firstName, lasttName: $lasttName, dob: $dob, gender: $gender, permenentAddres: $permenentAddres, existingNumberOfLoans: $existingNumberOfLoans, currentLoanAmount: $currentLoanAmount, blackListedInCRIB: $blackListedInCRIB)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bank &&
        other.nic == nic &&
        other.firstName == firstName &&
        other.lasttName == lasttName &&
        other.dob == dob &&
        other.gender == gender &&
        other.permenentAddres == permenentAddres &&
        other.existingNumberOfLoans == existingNumberOfLoans &&
        other.currentLoanAmount == currentLoanAmount &&
        other.blackListedInCRIB == blackListedInCRIB;
  }

  @override
  int get hashCode {
    return nic.hashCode ^
        firstName.hashCode ^
        lasttName.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        permenentAddres.hashCode ^
        existingNumberOfLoans.hashCode ^
        currentLoanAmount.hashCode ^
        blackListedInCRIB.hashCode;
  }
}
