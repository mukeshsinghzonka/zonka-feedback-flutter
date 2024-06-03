import 'package:equatable/equatable.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}