

import 'package:hive/hive.dart';

import '../../../services/hive/hive_type_id.dart';


import 'package:hive/hive.dart';

part 'logged_in_user.g.dart';

@HiveType(typeId: HiveTypeId.loggedInUserModel) // Ensure HiveTypeId.loggedInUserModel is defined
class LoggedInUser extends HiveObject {
  @HiveField(0)
  final String? userId;

  @HiveField(1)
  final bool? isOwner;

  @HiveField(2)
  final bool? isActive;

  @HiveField(3)
  final String? role;

  @HiveField(4)
  final bool? isExpired;

  @HiveField(5)
  final String? isFreeTrial;

  @HiveField(6)
  final dynamic spaUserId; // You may want to specify a proper type for these dynamic fields

  @HiveField(7)
  final dynamic isSuperAdmin;

  @HiveField(8)
  final dynamic spaUserEmail;

  LoggedInUser({
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

  // From JSON (factory constructor)
  factory LoggedInUser.fromJson(Map<String, dynamic> json) {
    return LoggedInUser(
      userId: json['userId'],
      isOwner: json['isOwner'],
      isActive: json['isActive'],
      role: json['role'],
      isExpired: json['isExpired'],
      isFreeTrial: json['isFreeTrial'],
      spaUserId: json['spaUserId'],
      isSuperAdmin: json['isSuperAdmin'],
      spaUserEmail: json['spaUserEmail'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'isOwner': isOwner,
      'isActive': isActive,
      'role': role,
      'isExpired': isExpired,
      'isFreeTrial': isFreeTrial,
      'spaUserId': spaUserId,
      'isSuperAdmin': isSuperAdmin,
      'spaUserEmail': spaUserEmail,
    };
  }
}
