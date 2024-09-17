


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
