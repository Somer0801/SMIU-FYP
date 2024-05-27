import 'package:flutter/material.dart';


class userModel{
  int? id;
  String? name;
  String? email;
  String? profile;
  String? university_id;
  String? role;
  String? token;
  String?password;


  userModel({
    this.id,
    this.name,
    this.profile,
    this.university_id,
    this.role,
    this.email,
    this.token,
    this.password

  });

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(
        id:json["id"],
        name: json['name'] ,
        email: json["email"],
        profile: json['profile'],
        university_id: json['university_id'],
        role: json["role"],
        token: json["token"],
        password: json["password"]


    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      'name': name,
      "email":email,
      'profile': profile,
      'university_id': university_id,
      "role":role,
      "token":token

    };
  }



}

