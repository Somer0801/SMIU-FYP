import 'package:flutter/material.dart';


class progressModel{
  int? id;
  int? groupNumber;
  String? topicName;
  double? progress;
  bool? attended;
  String? meeting_num;



  progressModel({
    this.id,
    this.groupNumber,
    this.progress,
    this.topicName,
    this.attended,
    this.meeting_num

  });

  factory progressModel.fromJson(Map<String, dynamic> json) {
    return progressModel(
      id:json["id"],
      groupNumber: json["groupNumber"],
      progress: json['profile'],
      topicName: json['topicName'],
      attended: json["role"],
      meeting_num: json["token"],



    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "groupNumber":groupNumber,
      "progress":progress,
      'topicname': topicName,
      'attended': attended,
      "meeting_num":meeting_num

    };
  }



}

