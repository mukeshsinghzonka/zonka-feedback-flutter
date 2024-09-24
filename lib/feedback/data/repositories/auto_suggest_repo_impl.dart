import 'package:zonka_feedback/feedback/data/data_source/network_ds/auto_suggest_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/auto_suggest_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class AutoSuggestRepoImpl extends AutoSuggestRepo {
  final AutoSuggestDs autoSuggestDs;
  AutoSuggestRepoImpl({required this.autoSuggestDs});

  @override
  Future<ApiResult<void>> getUserListRepo()async {
   return await autoSuggestDs.getUsersListDs();
  }
}
