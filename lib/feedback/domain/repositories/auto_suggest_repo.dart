
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class AutoSuggestRepo {
  Future<ApiResult<void>> getUserListRepo();
}