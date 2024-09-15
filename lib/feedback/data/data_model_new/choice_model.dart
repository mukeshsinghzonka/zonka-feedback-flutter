import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/option_gallery_image.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

// Register the adapters for all classes
part 'choice_model.g.dart';

// Choice Model
@HiveType(typeId: HiveTypeId.choiceModelId)
class Choice extends HiveObject with EquatableMixin {
  @HiveField(0)
  final Logic? logic;

  @HiveField(1)
  final String? choiceNodeId;

  @HiveField(2)
  final bool? isNaChoice;

  @HiveField(3)
  final int? choiceWeight;

  @HiveField(4)
  final bool? markedCorrect;

  @HiveField(5)
  final OptionGalleryImageId? optionGalleryImageId;

  @HiveField(6)
  final String? id;

  @HiveField(7)
  final Map<String, ChoiceTranslation> translations;

  @HiveField(8)
  final int? preMongifiedId;

  Choice({
    required this.logic,
    required this.choiceNodeId,
    required this.isNaChoice,
    required this.choiceWeight,
    required this.markedCorrect,
    required this.optionGalleryImageId,
    required this.id,
    required this.translations,
    required this.preMongifiedId,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      logic: json["logic"] == null ? null : Logic.fromJson(json["logic"]),
      choiceNodeId: json["choiceNodeId"],
      isNaChoice: json["isNaChoice"],
      choiceWeight: json["choiceWeight"],
      markedCorrect: json["markedCorrect"],
      optionGalleryImageId: json["optionGalleryImageId"] != null
          ? OptionGalleryImageId.fromJson(json['optionGalleryImageId'])
          : null,
      id: json["_id"] ?? "",
      translations: Map.from(json["translations"]).map((k, v) =>
          MapEntry<String, ChoiceTranslation>(
              k, ChoiceTranslation.fromJson(v))),
      preMongifiedId: json["pre_mongified_id"],
    );
  }

  @override
  List<Object?> get props => [
        logic,
        choiceNodeId,
        isNaChoice,
        choiceWeight,
        markedCorrect,
        optionGalleryImageId,
        id,
        translations,
        preMongifiedId,
      ];
}


