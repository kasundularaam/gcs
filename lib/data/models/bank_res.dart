import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'bank_person.dart';

class BankRes {
  final bool success;
  final String message;
  final String errorType;
  List<Bank> banks;
  BankRes({
    required this.success,
    required this.message,
    required this.errorType,
    required this.banks,
  });

  BankRes copyWith({
    bool? success,
    String? message,
    String? errorType,
    List<Bank>? banks,
  }) {
    return BankRes(
      success: success ?? this.success,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      banks: banks ?? this.banks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'errorType': errorType,
      'data': banks.map((x) => x.toMap()).toList(),
    };
  }

  factory BankRes.fromMap(Map<String, dynamic> map) {
    return BankRes(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      errorType: map['errorType'] ?? '',
      banks: map['data'] != null
          ? List<Bank>.from(map['data']?.map((x) => Bank.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory BankRes.fromJson(String source) =>
      BankRes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BankRes(success: $success, message: $message, errorType: $errorType, banks: $banks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankRes &&
        other.success == success &&
        other.message == message &&
        other.errorType == errorType &&
        listEquals(other.banks, banks);
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errorType.hashCode ^
        banks.hashCode;
  }
}
