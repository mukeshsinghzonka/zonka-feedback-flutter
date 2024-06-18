
import 'package:hive/hive.dart';
part 'login_response.g.dart';

@HiveType(typeId: 0)
class LoginResponse extends HiveObject{
 
  @HiveField(0)
  final String token;
  @HiveField(1)
  final bool isOnwer;
  @HiveField(2)
  final String email;
  
  LoginResponse({required this.token, required this.isOnwer, required this.email});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      isOnwer: json['user']['isOwner'],
      email: json['user']['email']??"",
    );
  }
}