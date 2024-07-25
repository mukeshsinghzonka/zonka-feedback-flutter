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
    final OptionGalleryImageId? optionGalleryImageId;
    final String? id;
    final Map<String, ChoiceTranslation> translations;
    final int? preMongifiedId;

    factory Choice.fromJson(Map<String, dynamic> json){ 
      print("optionGalleryImageId ${json["optionGalleryImageId"]}");
        return Choice(
            logic: json["logic"] == null ? null : Logic.fromJson(json["logic"]),
            choiceNodeId: json["choiceNodeId"],
            isNaChoice: json["isNaChoice"],
            choiceWeight: json["choiceWeight"],
            markedCorrect: json["markedCorrect"],
            optionGalleryImageId:json["optionGalleryImageId"] !=null ?OptionGalleryImageId.fromJson(json['optionGalleryImageId']) :null,
            id: json["_id"]??"",
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

    factory ChoiceTranslation.fromJson(Map<String, dynamic>? json){ 
        if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }
        return ChoiceTranslation(
            name: json["name"],
            helpText: json["helpText"],
        );
    }

}


class OptionGalleryImageId{
  final String path;
  final String id;
  final String companyId;

  OptionGalleryImageId({required this.path, required this.id, required this.companyId});

  factory OptionGalleryImageId.fromJson(Map<String, dynamic> json){
    return OptionGalleryImageId(
      path: json["path"],
      id: json["_id"],
      companyId: json["companyId"] 
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "path": path,
      "id": id,
      "companyId": companyId
    };
  }

}