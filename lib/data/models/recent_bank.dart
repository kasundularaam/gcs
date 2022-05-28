import 'dart:convert';

class RecentBank {
  final int bankID;
  final String bankName;
  final String bankType;
  final int accountNumber;
  RecentBank({
    required this.bankID,
    required this.bankName,
    required this.bankType,
    required this.accountNumber,
  });

  RecentBank copyWith({
    int? bankID,
    String? bankName,
    String? bankType,
    int? accountNumber,
  }) {
    return RecentBank(
      bankID: bankID ?? this.bankID,
      bankName: bankName ?? this.bankName,
      bankType: bankType ?? this.bankType,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bankID': bankID,
      'bankName': bankName,
      'bankType': bankType,
      'accountNumber': accountNumber,
    };
  }

  factory RecentBank.fromMap(Map<String, dynamic> map) {
    return RecentBank(
      bankID: map['bankID']?.toInt() ?? 0,
      bankName: map['bankName'] ?? '',
      bankType: map['bankType'] ?? '',
      accountNumber: map['accountNumber']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentBank.fromJson(String source) =>
      RecentBank.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecentBank(bankID: $bankID, bankName: $bankName, bankType: $bankType, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentBank &&
        other.bankID == bankID &&
        other.bankName == bankName &&
        other.bankType == bankType &&
        other.accountNumber == accountNumber;
  }

  @override
  int get hashCode {
    return bankID.hashCode ^
        bankName.hashCode ^
        bankType.hashCode ^
        accountNumber.hashCode;
  }
}
