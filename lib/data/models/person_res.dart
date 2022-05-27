import 'dart:convert';

import 'person.dart';

class PersonRes {
  final bool success;
  final String message;
  final String errorType;
  final Person person;
  PersonRes({
    required this.success,
    required this.message,
    required this.errorType,
    required this.person,
  });

  PersonRes copyWith({
    bool? success,
    String? message,
    String? errorType,
    Person? person,
  }) {
    return PersonRes(
      success: success ?? this.success,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      person: person ?? this.person,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'errorType': errorType,
      'data': person.toMap(),
    };
  }

  factory PersonRes.fromMap(Map<String, dynamic> map) {
    return PersonRes(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      errorType: map['errorType'] ?? '',
      person: map['data'] != null
          ? Person.fromMap(map['data'])
          : Person.fromMap({}),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonRes.fromJson(String source) =>
      PersonRes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PersonRes(success: $success, message: $message, errorType: $errorType, person: $person)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PersonRes &&
        other.success == success &&
        other.message == message &&
        other.errorType == errorType &&
        other.person == person;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errorType.hashCode ^
        person.hashCode;
  }
}
