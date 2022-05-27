import 'dart:convert';

import 'hospital.dart';

class HospitalRes {
  final bool success;
  final String message;
  final String errorType;
  final Hospital hospital;
  HospitalRes({
    required this.success,
    required this.message,
    required this.errorType,
    required this.hospital,
  });

  HospitalRes copyWith({
    bool? success,
    String? message,
    String? errorType,
    Hospital? hospital,
  }) {
    return HospitalRes(
      success: success ?? this.success,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      hospital: hospital ?? this.hospital,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'errorType': errorType,
      'data': hospital.toMap(),
    };
  }

  factory HospitalRes.fromMap(Map<String, dynamic> map) {
    return HospitalRes(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      errorType: map['errorType'] ?? '',
      hospital: map['data'] != null
          ? Hospital.fromMap(map['data'])
          : Hospital.fromMap({}),
    );
  }

  String toJson() => json.encode(toMap());

  factory HospitalRes.fromJson(String source) =>
      HospitalRes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HospitalRes(success: $success, message: $message, errorType: $errorType, hospital: $hospital)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HospitalRes &&
        other.success == success &&
        other.message == message &&
        other.errorType == errorType &&
        other.hospital == hospital;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errorType.hashCode ^
        hospital.hashCode;
  }
}
