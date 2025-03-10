import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'language_model.g.dart'; // This file will be generated by Hive


@HiveType(typeId: HiveTypeId.languageModelId)  // Assign a unique typeId for this class
class LanguageModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final int? preMongifiedId;

  @HiveField(2)
  final String? languageName;

  @HiveField(3)
  final String? languageCode;

  @HiveField(4)
  final String? languageLocalName;

  @HiveField(5)
  final DateTime? createdDate;

  @HiveField(6)
  final String? shortCode;

  @HiveField(7)
  final String? imageUrlAsset;

  LanguageModel({
    required this.id,
    required this.preMongifiedId,
    required this.languageName,
    required this.languageCode,
    required this.languageLocalName,
    required this.createdDate,
    required this.shortCode,
    required this.imageUrlAsset,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['_id'],
      preMongifiedId: json['pre_mongified_id'],
      languageName: json['languageName'],
      languageCode: json['languageCode'],
      languageLocalName: json['languageLocalName'],
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : null,
      shortCode: json['shortCode'],
      imageUrlAsset: "assets/large_flags/${json['languageCode'].toString().split('_')[1].toUpperCase()}.png",
    );
  }
}
