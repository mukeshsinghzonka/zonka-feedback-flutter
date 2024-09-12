
import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';
part 'login_response.g.dart';

@HiveType(typeId: HiveTypeId.typeIdLogin)
class LoginResponse extends HiveObject {
 
  @HiveField(0)
  final String token;
  @HiveField(1)
  final bool isOnwer;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String role;
  @HiveField(4)
  final String deviceId;
  @HiveField(5)
  final String companyName;
  @HiveField(6)
  final int companyPreMongifiedId;
  
  LoginResponse({required this.token, required this.isOnwer, required this.email, required this.role, required this.deviceId,
  required this.companyName, required this.companyPreMongifiedId
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token']??"",
      isOnwer: json['user']['isOwner']??false,
      email: json['user']['email']??"",
      role: json['user']['role']??"",
      deviceId: json['deviceId']??"",
      companyName: json['user']['companyId']['name']??"",
      companyPreMongifiedId: json['user']['companyId']['pre_mongified_id']??"",
    );
  }
}