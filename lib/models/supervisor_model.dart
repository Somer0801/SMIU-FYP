import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

// Supervisor model
class SupervisorModel {
   int? id;
  String? profile;
  String? description;
   String? name;
   String? email;
  String?universityId;
  String? role;


  SupervisorModel({
     this.id,
    this.profile,
    this.description,
     this.name,
     this.email,
    this.universityId,
    this.role,
  });

  factory SupervisorModel.fromJson(Map<String, dynamic> json) {
    return SupervisorModel(
      id: json['id'],
      profile: json['profile'],
      description: json['description'],
      name: json['name'],
      email: json['email'],
      universityId: json['university_id'],
      role: json['role'],
    );
  }
  @override
  String toString() {
    return '{id: $id, name: $name, email: $email, universityId: $universityId, role: $role}';
  }

}
