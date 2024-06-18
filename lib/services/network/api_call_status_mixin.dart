
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

mixin ApiCallStatusMixin{
  final Rx<ApiCallStatus> _apiStatus = ApiCallStatus.Initial.obs;   
  Rx<ApiCallStatus> get apiStatus => _apiStatus;
  void setStatus(ApiCallStatus status) {
    _apiStatus.value = status;
  } 
}