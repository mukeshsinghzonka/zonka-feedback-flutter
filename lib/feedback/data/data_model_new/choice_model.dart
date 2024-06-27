import 'package:zonka_feedback/feedback/data/data_model_new/logic_model.dart';

class Choice {
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

    final Logic? logic;
    final String? choiceNodeId;
    final bool? isNaChoice;
    final int? choiceWeight;
    final bool? markedCorrect;
    final dynamic optionGalleryImageId;
    final String? id;
    final Map<String, ChoiceTranslation> translations;
    final int? preMongifiedId;

    factory Choice.fromJson(Map<String, dynamic> json){ 
        return Choice(
            logic: json["logic"] == null ? null : Logic.fromJson(json["logic"]),
            choiceNodeId: json["choiceNodeId"],
            isNaChoice: json["isNaChoice"],
            choiceWeight: json["choiceWeight"],
            markedCorrect: json["markedCorrect"],
            optionGalleryImageId: json["optionGalleryImageId"],
            id: json["_id"],
            translations: Map.from(json["translations"]).map((k, v) => MapEntry<String, ChoiceTranslation>(k, ChoiceTranslation.fromJson(v))),
            preMongifiedId: json["pre_mongified_id"],
        );
    }

}


class ChoiceTranslation {
    ChoiceTranslation({
        required this.name,
        required this.helpText,
    });

    final String? name;
    final String? helpText;

    factory ChoiceTranslation.fromJson(Map<String, dynamic> json){ 
        return ChoiceTranslation(
            name: json["name"],
            helpText: json["helpText"],
        );
    }

}