import 'dart:convert';

class SelectPhone {
  final String phoneNumber;
  SelectPhone({
    required this.phoneNumber,
  });

  SelectPhone copyWith({
    String? phoneNumber,
  }) {
    return SelectPhone(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
    };
  }

  factory SelectPhone.fromMap(Map<String, dynamic> map) {
    return SelectPhone(
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectPhone.fromJson(String source) =>
      SelectPhone.fromMap(json.decode(source));

  @override
  String toString() => 'SelectPhone(phoneNumber: $phoneNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectPhone && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => phoneNumber.hashCode;
}
