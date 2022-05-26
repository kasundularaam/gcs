import 'dart:convert';

class Person {
  final String id;
  final String name;
  final String nic;
  final String phone;
  Person({
    required this.id,
    required this.name,
    required this.nic,
    required this.phone,
  });

  Person copyWith({
    String? id,
    String? name,
    String? nic,
    String? phone,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      nic: nic ?? this.nic,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nic': nic,
      'phone': phone,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      nic: map['nic'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Person(id: $id, name: $name, nic: $nic, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.id == id &&
        other.name == name &&
        other.nic == nic &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ nic.hashCode ^ phone.hashCode;
  }
}
