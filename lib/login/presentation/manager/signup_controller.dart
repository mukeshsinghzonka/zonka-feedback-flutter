import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString dataCenter = "US".obs;

  void setDataCenter(String? value) {
    dataCenter.value = value ?? "";
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController companyNameTextController = TextEditingController();

  
}
