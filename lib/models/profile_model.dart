import 'dart:convert';

class ProfileModel {
  String name;
  String email;
  String rollNumber;
  String profileImg;
  String department;
  String fyp;

  ProfileModel({
    required this.name,
    required this.email,
    required this.rollNumber,
    required this.profileImg,
    required this.department,
    required this.fyp,
  });

  // Factory constructor to create an instance from a map
  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      rollNumber: map['rollNumber'] ?? '',
      profileImg: map['profileImg'] ?? '',
      department: map['department'] ?? '',
      fyp: map['fyp'] ?? '',
    );
  }

  // Method to convert the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'rollNumber': rollNumber,
      'profileImg': profileImg,
      'department': department,
      'fyp': fyp,
    };
  }

  // Method to convert the instance to a JSON string
  String toJson() => json.encode(toMap());

  // Factory constructor to create an instance from a JSON string
  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source));
}
