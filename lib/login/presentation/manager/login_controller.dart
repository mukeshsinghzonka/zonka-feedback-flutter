import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/data/data_model/signin_body_model.dart';
import 'package:zonka_feedback/login/data/data_source/login_ds.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exception_mixin.dart';

enum LoginStatus { initial, loading, success, error }

class LoginController extends GetxController with  NetworkExceptionsMixin {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  LoginUserDs loginUserDs = LoginUserDs();
 
  final Rx<LoginStatus> _loginStatus = LoginStatus.initial.obs;   
  Rx<LoginStatus> get loginStatus => _loginStatus;
  void setStatus(LoginStatus status) {
    _loginStatus.value = status;
  }


  Future<void> loginUser() async {
    setStatus(LoginStatus.loading);
    ApiResult<void> response = await loginUserDs.loginUser(signInBodyModel:SignInBodyModel(emailId:emailTextController.text, password:passwordTextController.text));
    response.when(success: (data) async {
     setStatus(LoginStatus.success);
    }, failure: (error) async {
    setStatus(LoginStatus.error);
    setNetworkExceptions(error);
    });
  }
}


