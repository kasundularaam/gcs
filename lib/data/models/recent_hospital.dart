import 'dart:convert';

class RecentHospital {
  final String hospitalName;
  final String lastUpdatedDate;
  final String sector;
  RecentHospital({
    required this.hospitalName,
    required this.lastUpdatedDate,
    required this.sector,
  });

  RecentHospital copyWith({
    String? hospitalName,
    String? lastUpdatedDate,
    String? sector,
  }) {
    return RecentHospital(
      hospitalName: hospitalName ?? this.hospitalName,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
      sector: sector ?? this.sector,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hospitalName': hospitalName,
      'lastUpdatedDate': lastUpdatedDate,
      'sector': sector,
    };
  }

  factory RecentHospital.fromMap(Map<String, dynamic> map) {
    return RecentHospital(
      hospitalName: map['hospitalName'] ?? '',
      lastUpdatedDate: map['lastUpdatedDate'] ?? '',
      sector: map['sector'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentHospital.fromJson(String source) =>
      RecentHospital.fromMap(json.decode(source));

  @override
  String toString() =>
      'RecentHospital(hospitalName: $hospitalName, lastUpdatedDate: $lastUpdatedDate, sector: $sector)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentHospital &&
        other.hospitalName == hospitalName &&
        other.lastUpdatedDate == lastUpdatedDate &&
        other.sector == sector;
  }

  @override
  int get hashCode =>
      hospitalName.hashCode ^ lastUpdatedDate.hashCode ^ sector.hashCode;
}
