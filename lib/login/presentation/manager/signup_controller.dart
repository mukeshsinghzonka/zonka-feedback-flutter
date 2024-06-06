import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/login/domain/usecase/signup_user_uc.dart';
import 'package:zonka_feedback/services/dialog_util.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

enum SignUpStatus{ initial, loading, loaded, error}

class SignupController extends GetxController {
  RxString dataCenter = "US".obs;
  SignUpUserUC signUpUserUC = getIt<SignUpUserUC>();
  void setDataCenter(String? value) {
    dataCenter.value = value ?? "";
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController companyNameTextController = TextEditingController();

  void signupUser({required BuildContext context}) async  {
     DialogUtils.showCustomLoadingDialog(context);
     ApiResult<void> response = await signUpUserUC(SignUpBodyModel(
      email: emailTextController.text,
      password: passwordTextController.text,
      name: nameTextController.text,
      companyName: companyNameTextController.text,
      region: dataCenter.value,
    ));
    response.when(success: (data) async {
      print("Success");
    }, failure: (error) async {   
      DialogUtils.showCustomErrorDialog(context,title: NetworkExceptions.getErrorMessage(error??const NetworkExceptions.defaultError("Default Error")));
    });

  }
  
}
