import 'package:zonka_feedback/services/network/api_call_status_mixin.dart';
import 'package:zonka_feedback/services/network/network_exception_mixin.dart';
import 'package:get/get.dart';

abstract class BaseControllerWithParams<Type, Params> extends GetxController with  NetworkExceptionsMixin, ApiCallStatusMixin {
   Future<Type> call(Params params);
}


abstract class BaseControllerWithOutParams<Type> extends GetxController with  NetworkExceptionsMixin, ApiCallStatusMixin {
   Future<Type> call();
}

