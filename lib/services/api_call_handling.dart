
import 'package:flutter/material.dart';
import 'package:zonka_feedback/services/dialog_util.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class ApiCallHandling {
   final dynamic controller;
   final ApiCallStatus status;
 
   final Function success;
   ApiCallHandling({required this.controller, required this.status, required this.success});    
   
  void handleApiCall() async {
   if(controller.apiStatus.value == ApiCallStatus.Initial){
     DialogUtils.showCustomLoadingDialog(NavigationService.navigatorKey.currentContext!);
     await controller.call();
   }

   if(controller.apiStatus.value == ApiCallStatus.Success){
     controller.apiStatus.value = ApiCallStatus.Initial;
     Navigator.of(NavigationService.navigatorKey.currentContext!).pop();
     success();
   }

    if(controller.apiStatus.value == ApiCallStatus.Error){
      Navigator.of(NavigationService.navigatorKey.currentContext!).pop();
      controller.apiStatus.value = ApiCallStatus.Initial;
      DialogUtils.showCustomErrorDialog(NavigationService.navigatorKey.currentContext!, title:  NetworkExceptions.getErrorMessage(controller.networkExceptions??const NetworkExceptions.defaultError("Default Error")));
    } 
  }
}