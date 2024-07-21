import 'package:flutter/material.dart';

class ProposalModel {
  int? id;
  String? session;
  String? date;
  String? topic1;
  String? topic2;
  String? topic3;
  String? description1;
  String? description2;
  String? description3;
  int? supervisor1;
  int? supervisor2;
  int? supervisor3;
  int? userId1;
  int? userId2;
  int? userId3;
  int? teamId;
  String? updatedAt;
  String? createdAt;

  ProposalModel({
    this.id,
    this.session,
    this.date,
    this.topic1,
    this.topic2,
    this.topic3,
    this.description1,
    this.description2,
    this.description3,
    this.supervisor1,
    this.supervisor2,
    this.supervisor3,
    this.userId1,
    this.userId2,
    this.userId3,
    this.teamId,
    this.updatedAt,
    this.createdAt,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) {
    return ProposalModel(
      id: json["id"],
      session: json['session'],
      date: json["date"],
      topic1: json['topic_1'],
      topic2: json['topic_2'],
      topic3: json['topic_3'],
      description1: json["description_1"],
      description2: json["description_2"],
      description3: json["description_3"],
      supervisor1: json["sup_1"],
      supervisor2: json["sup_2"],
      supervisor3: json["sup_3"],
      userId1: json["user_id1"],
      userId2: json["user_id2"],
      userId3: json["user_id3"],
      teamId: json["team_id"],
      updatedAt: json["updated_at"],
      createdAt: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'session': session,
      "date": date,
      'topic_1': topic1,
      'topic_2': topic2,
      'topic_3': topic3,
      "description_1": description1,
      "description_2": description2,
      "description_3": description3,
      "sup_1": supervisor1,
      "sup_2": supervisor2,
      "sup_3": supervisor3,
      "user_id1": userId1,
      "user_id2": userId2,
      "user_id3": userId3,
      "team_id": teamId,
      "updated_at": updatedAt,
      "created_at": createdAt,
    };
  }
}
