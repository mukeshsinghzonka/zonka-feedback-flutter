

import 'package:zonka_feedback/feedback/domain/repositories/auto_suggest_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class AutoSuggestUc extends UseCaseNoParams<ApiResult<void>>{
  
  final AutoSuggestRepo autoSuggestRepo;
  AutoSuggestUc({required this.autoSuggestRepo});

  @override
  Future<ApiResult<void>> call() async {
    return await autoSuggestRepo.getUserListRepo();
  }


}