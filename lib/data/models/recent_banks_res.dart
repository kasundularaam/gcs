import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'recent_bank.dart';

class RecentBanksRes {
  final bool success;
  final String message;
  final String errorType;
  final List<RecentBank> recentBanks;
  RecentBanksRes({
    required this.success,
    required this.message,
    required this.errorType,
    required this.recentBanks,
  });

  RecentBanksRes copyWith({
    bool? success,
    String? message,
    String? errorType,
    List<RecentBank>? recentBanks,
  }) {
    return RecentBanksRes(
      success: success ?? this.success,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      recentBanks: recentBanks ?? this.recentBanks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'errorType': errorType,
      'data': recentBanks.map((x) => x.toMap()).toList(),
    };
  }

  factory RecentBanksRes.fromMap(Map<String, dynamic> map) {
    return RecentBanksRes(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      errorType: map['errorType'] ?? '',
      recentBanks: map['data'] != null
          ? List<RecentBank>.from(
              map['data']?.map((x) => RecentBank.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentBanksRes.fromJson(String source) =>
      RecentBanksRes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecentBanksRes(success: $success, message: $message, errorType: $errorType, recentBanks: $recentBanks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentBanksRes &&
        other.success == success &&
        other.message == message &&
        other.errorType == errorType &&
        listEquals(other.recentBanks, recentBanks);
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errorType.hashCode ^
        recentBanks.hashCode;
  }
}
