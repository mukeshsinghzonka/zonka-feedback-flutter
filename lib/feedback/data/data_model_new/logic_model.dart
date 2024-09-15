import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'logic_model.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: HiveTypeId.logicModelId) // Unique type ID for Logic adapter
class Logic extends HiveObject {
  @HiveField(0)
  final String? actionTaken;

  @HiveField(1)
  final String? skipToScreenOrQuestion;

  @HiveField(2)
  final String? showQuestionList;

  @HiveField(3)
  final String? hideQuestionList;

  @HiveField(4)
  final String? redirectUrl;

  @HiveField(5)
  final String? skipHideRedirectTo;

  // Optional fields that are not included in Hive serialization
  // @HiveField(6)
  // final List<dynamic>? locationBasedUrls;

  // @HiveField(7)
  // final List<dynamic>? languageBasedUrls;

  Logic({
    required this.actionTaken,
    required this.skipToScreenOrQuestion,
    required this.showQuestionList,
    required this.hideQuestionList,
    required this.redirectUrl,
    required this.skipHideRedirectTo,
    // required this.locationBasedUrls,
    // required this.languageBasedUrls,
  });

  factory Logic.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }

    return Logic(
      actionTaken: json["actionTaken"],
      skipToScreenOrQuestion: json["skipToScreenOrQuestion"],
      showQuestionList: json["showQuestionList"],
      hideQuestionList: json["hideQuestionList"],
      redirectUrl: json["redirectUrl"],
      skipHideRedirectTo: json["skipHideRedirectTo"],
      // locationBasedUrls: json["locationBasedUrls"] == null ? [] : List<dynamic>.from(json["locationBasedUrls"]!.map((x) => x)),
      // languageBasedUrls: json["languageBasedUrls"] == null ? [] : List<dynamic>.from(json["languageBasedUrls"]!.map((x) => x)),
    );
  }
}

