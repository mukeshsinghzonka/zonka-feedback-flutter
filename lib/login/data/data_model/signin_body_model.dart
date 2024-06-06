import 'package:zonka_feedback/login/data/data_model/device_detail.dart';


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
      "device": DeviceDetailsModel().toJson(),
    };
  
  }
}
