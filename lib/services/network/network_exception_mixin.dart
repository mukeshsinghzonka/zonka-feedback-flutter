

import 'package:zonka_feedback/services/dialog_util.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

mixin NetworkExceptionsMixin{
 late NetworkExceptions? _networkExceptions;
 void setNetworkExceptions(NetworkExceptions? networkExceptions){
    DialogUtils.showCustomErrorDialog(NavigationService.navigatorKey.currentContext!, title: NetworkExceptions.getErrorMessage(networkExceptions!));
   _networkExceptions = networkExceptions;
 }
  NetworkExceptions? get networkExceptions => _networkExceptions;
}