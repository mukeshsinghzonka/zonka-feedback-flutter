
class SignInBodyModel {
  final String password;
  final String emailId;
  SignInBodyModel(
      {
      required this.password,
      required this.emailId,
   });

  Map<String, dynamic> toJsonAndroid() {
    return {
      "email": emailId,
      "password":password,
      // "device": DeviceDemtailsModel().toJson(),

      
    };
  
  }
}
