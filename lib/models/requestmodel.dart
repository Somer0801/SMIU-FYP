class RequestModel {
  int? id;
  int? teamId;
  int? sup1;
  int? sup2;
  int? sup3;
  int? active;
  String? createdAt;
  String? updatedAt;
  Team? team;
  int? supervisorId; // new field
  String? reason; // new field
  int? accept; // new field
  int? status; // new field
  Supervisor? supervisor; // new field

  RequestModel(
      {this.id,
        this.teamId,
        this.sup1,
        this.sup2,
        this.sup3,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.team,
        this.supervisorId, // new field
        this.reason, // new field
        this.accept, // new field
        this.status, // new field
        this.supervisor}); // new field

  RequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    sup1 = json['sup_1'];
    sup2 = json['sup_2'];
    sup3 = json['sup_3'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    supervisorId = json['supervisor_id']; // new field
    reason = json['reason']; // new field
    accept = json['accept']; // new field
    status = json['status']; // new field
    supervisor = json['supervisor'] != null ? new Supervisor.fromJson(json['supervisor']) : null; // new field
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_id'] = this.teamId;
    data['sup_1'] = this.sup1;
    data['sup_2'] = this.sup2;
    data['sup_3'] = this.sup3;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['supervisor_id'] = this.supervisorId; // new field
    data['reason'] = this.reason; // new field
    data['accept'] = this.accept; // new field
    data['status'] = this.status; // new field
    if (this.supervisor != null) {
      data['supervisor'] = this.supervisor!.toJson(); // new field
    }
    return data;
  }
}

class Supervisor {
  int? id;
  String? name;
  String? email;
  String? universityId;
  String? role;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? teamId;
  int? departmentId;

  Supervisor(
      {this.id,
        this.name,
        this.email,
        this.universityId,
        this.role,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.teamId,
        this.departmentId});

  Supervisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    universityId = json['university_id'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamId = json['team_id'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['university_id'] = this.universityId;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['team_id'] = this.teamId;
    data['department_id'] = this.departmentId;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? supervisorId;
  int? approve;

  Team(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.supervisorId,
        this.approve});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    supervisorId = json['supervisor_id'];
    approve = json['approve'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['supervisor_id'] = this.supervisorId;
    data['approve'] = this.approve;
    return data;
  }
}
