

class LoginResponse {

  final String token;
  final String ? userType;
  final bool isOnwer;
  final String ? email;
  LoginResponse({required this.token, this.userType, required this.isOnwer, this.email});

}