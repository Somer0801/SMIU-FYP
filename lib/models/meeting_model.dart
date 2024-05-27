import 'package:flutter/material.dart';


class meetingModel{
  int? id;
  String? professorName;
  String? meetingdate;
  String? progress;
  String? topicName;
  bool? attended;
  String? meeting_num;



  meetingModel({
    this.id,
    this.professorName,
    this.meetingdate,
    this.progress,
    this.topicName,
    this.attended,
    this.meeting_num

  });

  factory meetingModel.fromJson(Map<String, dynamic> json) {
    return meetingModel(
        id:json["id"],
        professorName : json['name'] ,
        meetingdate: json["email"],
        progress: json['profile'],
        topicName: json['university_id'],
        attended: json["role"],
        meeting_num: json["token"],



    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      'professorName': professorName,
      "progress":progress,
      'topicname': topicName,
      'attended': attended,
      "meetingdate":meetingdate,
      "meeting_num":meeting_num

    };
  }



}

