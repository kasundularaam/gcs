import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'recent_hospital.dart';

class RecentHospitalsRes {
  final String success;
  final String message;
  final String errorType;
  final List<RecentHospital> recentHospitals;
  RecentHospitalsRes({
    required this.success,
    required this.message,
    required this.errorType,
    required this.recentHospitals,
  });

  RecentHospitalsRes copyWith({
    String? success,
    String? message,
    String? errorType,
    List<RecentHospital>? recentHospitals,
  }) {
    return RecentHospitalsRes(
      success: success ?? this.success,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      recentHospitals: recentHospitals ?? this.recentHospitals,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'errorType': errorType,
      'data': recentHospitals.map((x) => x.toMap()).toList(),
    };
  }

  factory RecentHospitalsRes.fromMap(Map<String, dynamic> map) {
    return RecentHospitalsRes(
      success: map['success'] ?? '',
      message: map['message'] ?? '',
      errorType: map['errorType'] ?? '',
      recentHospitals: map['data'] != null
          ? List<RecentHospital>.from(
              map['data']?.map((x) => RecentHospital.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentHospitalsRes.fromJson(String source) =>
      RecentHospitalsRes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecentHospitalsRes(success: $success, message: $message, errorType: $errorType, recentHospitals: $recentHospitals)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentHospitalsRes &&
        other.success == success &&
        other.message == message &&
        other.errorType == errorType &&
        listEquals(other.recentHospitals, recentHospitals);
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errorType.hashCode ^
        recentHospitals.hashCode;
  }
}
