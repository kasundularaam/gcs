import 'dart:convert';

class Person {
  final String nic;
  final String firstName;
  final String lastName;
  final String dob;
  final String address;
  final String gender;
  final String imageURL;
  Person({
    required this.nic,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.address,
    required this.gender,
    required this.imageURL,
  });

  Person copyWith({
    String? nic,
    String? firstName,
    String? lastName,
    String? dob,
    String? address,
    String? gender,
    String? imageURL,
  }) {
    return Person(
      nic: nic ?? this.nic,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nic': nic,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'address': address,
      'gender': gender,
      'imageURL': imageURL,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      nic: map['nic'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      dob: map['dob'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      imageURL: map['imageURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Person(nic: $nic, firstName: $firstName, lastName: $lastName, dob: $dob, address: $address, gender: $gender, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.nic == nic &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dob == dob &&
        other.address == address &&
        other.gender == gender &&
        other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return nic.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        dob.hashCode ^
        address.hashCode ^
        gender.hashCode ^
        imageURL.hashCode;
  }
}
