import 'dart:convert';

import 'select_phone.dart';

class SelectPhoneRes {
  final bool success;
  final String message;
  final String errorType;
  final SelectPhone phone;
  SelectPhoneRes({
    required this.success,
    required this.message,
    required this.errorType,
    required this.phone,
  });

  SelectPhoneRes copyWith({
    bool? success,
    String? message,
    String? errorType,
    SelectPhone? phone,
  }) {
    return SelectPhoneRes(
      success: success ?? this.success,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'errorType': errorType,
      'phone': phone.toMap(),
    };
  }

  factory SelectPhoneRes.fromMap(Map<String, dynamic> map) {
    return SelectPhoneRes(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      errorType: map['errorType'] ?? '',
      phone: map['data'] != null
          ? SelectPhone.fromMap(map['data'])
          : SelectPhone.fromMap({}),
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectPhoneRes.fromJson(String source) =>
      SelectPhoneRes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SelectPhoneRes(success: $success, message: $message, errorType: $errorType, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectPhoneRes &&
        other.success == success &&
        other.message == message &&
        other.errorType == errorType &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errorType.hashCode ^
        phone.hashCode;
  }
}
