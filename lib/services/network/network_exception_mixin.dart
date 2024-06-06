

import 'package:zonka_feedback/services/network/network_exceptions.dart';

mixin NetworkExceptionsMixin{
 late NetworkExceptions? _networkExceptions;
 void setNetworkExceptions(NetworkExceptions? networkExceptions){
   _networkExceptions = networkExceptions;
 }
  NetworkExceptions? get networkExceptions => _networkExceptions;
}