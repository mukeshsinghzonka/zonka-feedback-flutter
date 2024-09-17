import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/login/domain/usecase/signup_user_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


class SignupController extends BaseControllerWithOutParams<void> {
  RxString dataCenter = "US".obs;
  SignUpUserUC signUpUserUC = getIt<SignUpUserUC>();
  void setDataCenter(String? value) {
    dataCenter.value = value ?? "";
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController companyNameTextController = TextEditingController();
  
  @override
  Future<void> call() async {
   setStatus(ApiCallStatus.Loading);
     ApiResult<void> response = await  getIt.get<SignUpUserUC>().call(SignUpBodyModel(
      email: emailTextController.text,
      password: passwordTextController.text,
      name: nameTextController.text,
      companyName: companyNameTextController.text,
      region: dataCenter.value,
      ));
     response.when(success: (data) async {
      WorkManagerService().updateFailedSurveyTask();
     setStatus(ApiCallStatus.Success);
     return;
    }, failure: (error) async {
    setStatus(ApiCallStatus.Error);
    setNetworkExceptions(error);
    });
  }

  void clearTextFields() {
    emailTextController.clear();
    passwordTextController.clear();
    nameTextController.clear();
    companyNameTextController.clear();
  }
  
}
