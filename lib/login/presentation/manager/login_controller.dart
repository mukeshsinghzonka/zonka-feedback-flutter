import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/data/data_source/login_ds.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class LoginController extends GetxController with StateMixin<bool> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  LoginUserDs loginUserDs = LoginUserDs();

  void loginUser() async {
      change(
        null,
        status: RxStatus.empty(),
      );
    ApiResult<void> response = await loginUserDs.loginUser(
        email: emailTextController.text, password: passwordTextController.text);
    response.when(success: (data) async {
      change(
        true,
        status: RxStatus.success(),
      );
    }, failure: (error) async {
      change(
        false,
        status: RxStatus.error(
          NetworkExceptions.getErrorMessage(error!),
        ),
      );
    });
  }
}
