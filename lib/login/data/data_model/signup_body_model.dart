import 'package:zonka_feedback/login/data/data_model/device_detail.dart';

class SignUpBodyModel {
  final String email;
  final String password;
  final String companyName;
  final String name;
  final String region;
  SignUpBodyModel(
      {required this.email,
      required this.password,
      required this.companyName,
      required this.name,
      required this.region,
      });

  Map<String, dynamic> toJsonAndroid() {
    return {
      "name":name,
      "email": email,
      "password":password,
      "device": DeviceDetailsModel().toJson(),
      "companyName":companyName,
      "region":region
    };
  }
}
