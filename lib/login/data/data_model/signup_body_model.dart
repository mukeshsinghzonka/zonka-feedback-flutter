class SignUpBodyModel {
  final String email;
  final String password;
  final String companyName;
  final String name;
  final String region;
  final bool zonkaDebugFlag;
  SignUpBodyModel(
      {required this.email,
      required this.password,
      required this.companyName,
      required this.name,
      required this.region,
      required this.zonkaDebugFlag});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'companyName': companyName,
      'fullName': name,
      'region': region,
      'zonkaDebugFlag': false,
       "mobile": ""
    };
  }
}
