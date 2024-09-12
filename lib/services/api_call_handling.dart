
import 'package:flutter/material.dart';
import 'package:zonka_feedback/services/dialog_util.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class ApiCallHandling {
   final dynamic controller;
   final ApiCallStatus status;
   final Function success;
   final bool sendParams;
   final String dialogBoxtitle;
   ApiCallHandling({required this.controller, required this.status, required this.success,required this.sendParams, required this.dialogBoxtitle});    
   
  void handleApiCall({dynamic value}) async {
    bool networkCheck = await NetworkConnectivity().isConnected();
   if(controller.apiStatus.value == ApiCallStatus.Initial && networkCheck){
     DialogUtils.showCustomLoadingDialog(NavigationService.navigatorKey.currentContext!,dialogBoxtitle);
     if(sendParams){
      await controller.call(value);
     }else{
     await controller.call();
      }
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