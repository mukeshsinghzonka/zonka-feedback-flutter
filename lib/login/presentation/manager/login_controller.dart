import 'package:flutter/material.dart';
import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';
import 'package:zonka_feedback/login/data/data_model/signin_body_model.dart';
import 'package:zonka_feedback/login/domain/usecase/login_user_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class LoginController extends BaseControllerWithOutParams<void> {
 
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  
  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
     ApiResult<LoginResponse> response = await  getIt.get<LoginUserUc>().call(SignInBodyModel(emailId:emailTextController.text, password:passwordTextController.text));
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
  }
}


