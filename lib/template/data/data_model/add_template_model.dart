class AddTemplateModel {
  final String ?id;
  final int ?preMongifiedId;
  final String ?name;
  final String ?uniqueRefCode;
  final String ?workSpaceId;
  final LoggedinUser? loggedinUser;

  AddTemplateModel({
    required this.id,
    required this.preMongifiedId,
    required this.name,
    required this.uniqueRefCode,
    required this.workSpaceId,
    required this.loggedinUser,
  });

  factory AddTemplateModel.fromJson(Map<String, dynamic> json) =>
      AddTemplateModel(
          id: json['_id'],
          preMongifiedId: json["pre_mongified_id"],
          name: json['name'],
          uniqueRefCode: json['uniqueRefCode'],
          workSpaceId: json['workSpaceId'],
          loggedinUser: json['loggedinUser'] != null
              ? LoggedinUser.fromJson(json['loggedinUser'])
              : null);
}

class LoggedinUser {
  final String? userId;
  final bool? isOwner;
  final bool ?isActive;
  final String ?role;
  final bool ?isExpired;
  final String? isFreeTrial;
  final String ?spaUserId;
  final String? isSuperAdmin;
  final String ?spaUserEmail;

  LoggedinUser({
    required this.userId,
    required this.isOwner,
    required this.isActive,
    required this.role,
    required this.isExpired,
    required this.isFreeTrial,
    required this.spaUserId,
    required this.isSuperAdmin,
    required this.spaUserEmail,
  });

  factory LoggedinUser.fromJson(Map<String, dynamic> json) => LoggedinUser(
      userId: json["userId"],
      isOwner: json["isOwner"],
      isActive: json["isActive"],
      role: json["role"],
      isExpired: json["isExpired"],
      isFreeTrial: json['isFreeTrial'],
      spaUserId: json['spaUserId'],
      isSuperAdmin: json['isSuperAdmin'],
      spaUserEmail: json['spaUserEmail']);
}
