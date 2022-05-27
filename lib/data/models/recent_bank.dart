import 'dart:convert';

class RecentBank {
  final int bankId;
  final String bankName;
  final String bankType;
  final int accountNumber;
  RecentBank({
    required this.bankId,
    required this.bankName,
    required this.bankType,
    required this.accountNumber,
  });

  RecentBank copyWith({
    int? bankId,
    String? bankName,
    String? bankType,
    int? accountNumber,
  }) {
    return RecentBank(
      bankId: bankId ?? this.bankId,
      bankName: bankName ?? this.bankName,
      bankType: bankType ?? this.bankType,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bankId': bankId,
      'bankName': bankName,
      'bankType': bankType,
      'accountNumber': accountNumber,
    };
  }

  factory RecentBank.fromMap(Map<String, dynamic> map) {
    return RecentBank(
      bankId: map['bankId']?.toInt() ?? 0,
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
    return 'RecentBank(bankId: $bankId, bankName: $bankName, bankType: $bankType, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentBank &&
        other.bankId == bankId &&
        other.bankName == bankName &&
        other.bankType == bankType &&
        other.accountNumber == accountNumber;
  }

  @override
  int get hashCode {
    return bankId.hashCode ^
        bankName.hashCode ^
        bankType.hashCode ^
        accountNumber.hashCode;
  }
}
