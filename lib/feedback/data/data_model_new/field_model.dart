
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/filed_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/heading_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/option_model.dart';

class Field {
    Field({
        required this.logic,
        required this.screenType,
        required this.required,
        required this.isRating,
        required this.includeInCsat,
        required this.includeForAnalysis,
        required this.validateRegex,
        required this.paramId,
        required this.fieldName,
        required this.fieldCategory,
        required this.sequenceOrder,
        required this.screenSequenceOrder,
        required this.displayLayout,
        required this.choiceLayout,
        required this.isButtonColored,
        required this.buttonStyle,
        required this.positiveOptionDirection,
        required this.helpTextPlacement,
        required this.hideField,
        required this.hideFieldInDevice,
        required this.isNaChoiceVisible,
        required this.isPrimaryField,
        required this.specialSettingVal,
        required this.specialSettingVal2,
        required this.specialSettingVal3,
        required this.specialSettingVal4,
        required this.specialSettingVal5,
        required this.choicesHasImage,
        required this.isLastChoiceNa,
        // required this.displayLogic,
        required this.displayLogicExpression,
        required this.iconSet,
        required this.iconType,
        required this.isInitialBright,
        required this.isIconSvg,
        required this.isTranslucent,
        required this.isStacked,
        required this.hideChoiceLabelInSurvey,
        required this.randomizeChoices,
        required this.mediaType,
        required this.videoEmbedScript,
        required this.quesImages,
        required this.quizTimeout,
        required this.id,
        required this.choices,
        required this.companyId,
        required this.createdBy,
        required this.createdDate,
        required this.modifiedBy,
        required this.modifiedDate,
        required this.options,
        required this.preMongifiedId,
        required this.surveyId,
        required this.translations,
    });

    final Logic? logic;
    final String? screenType;
    final bool? required;
    final bool? isRating;
    final bool? includeInCsat;
    final bool? includeForAnalysis;
    final String? validateRegex;
    final String? paramId;
    final String? fieldName;
    final String? fieldCategory;
    final int? sequenceOrder;
    final int? screenSequenceOrder;
    final String? displayLayout;
    final String? choiceLayout;
    final bool? isButtonColored;
    final String? buttonStyle;
    final String? positiveOptionDirection;
    final String? helpTextPlacement;
    final bool? hideField;
    final bool? hideFieldInDevice;
    final bool? isNaChoiceVisible;
    final bool? isPrimaryField;
    final String? specialSettingVal;
    final String? specialSettingVal2;
    final String? specialSettingVal3;
    final String? specialSettingVal4;
    final String? specialSettingVal5;
    final bool? choicesHasImage;
    final bool? isLastChoiceNa;
    // final List<dynamic> displayLogic;
    final String? displayLogicExpression;
    final int? iconSet;
    final String? iconType;
    final bool? isInitialBright;
    final bool? isIconSvg;
    final bool? isTranslucent;
    final bool? isStacked;
    final bool? hideChoiceLabelInSurvey;
    final bool? randomizeChoices;
    final String? mediaType;
    final String? videoEmbedScript;
    final List<HeadingImage> quesImages;
    final int? quizTimeout;
    final String? id;
    final List<Choice> choices;
    final String? companyId;
    final String? createdBy;
    final DateTime? createdDate;
    final String? modifiedBy;
    final DateTime? modifiedDate;
    final List<Option> options;
    final int? preMongifiedId;
    final String? surveyId;
    final Map<String, FieldTranslation>? translations;

    factory Field.fromJson(Map<String, dynamic> json){ 
      // print("Fieldlogic ${json["quesImages"]}");
        return Field(
            logic: json["logic"] == null ? null : Logic.fromJson(json["logic"]),
            screenType: json["screenType"],
            required: json["required"],
            isRating: json["isRating"],
            includeInCsat: json["includeInCSAT"],
            includeForAnalysis: json["includeForAnalysis"],
            validateRegex: json["validateRegex"],
            paramId: json["paramId"],
            fieldName: json["fieldName"],
            fieldCategory: json["fieldCategory"],
            sequenceOrder: json["sequenceOrder"],
            screenSequenceOrder: json["screenSequenceOrder"],
            displayLayout: json["displayLayout"],
            choiceLayout: json["choiceLayout"],
            isButtonColored: json["isButtonColored"],
            buttonStyle: json["buttonStyle"],
            positiveOptionDirection: json["positiveOptionDirection"],
            helpTextPlacement: json["helpTextPlacement"],
            hideField: json["hideField"],
            hideFieldInDevice: json["hideFieldInDevice"],
            isNaChoiceVisible: json["isNaChoiceVisible"],
            isPrimaryField: json["isPrimaryField"],
            specialSettingVal: json["specialSettingVal"],
            specialSettingVal2: json["specialSettingVal2"],
            specialSettingVal3: json["specialSettingVal3"],
            specialSettingVal4: json["specialSettingVal4"],
            specialSettingVal5: json["specialSettingVal5"],
            choicesHasImage: json["choicesHasImage"],
            isLastChoiceNa: json["isLastChoiceNA"],
            // displayLogic: json["displayLogic"] == null ? [] : List<dynamic>.from(json["displayLogic"]!.map((x) => x)),
            displayLogicExpression: json["displayLogicExpression"],
            iconSet: json["iconSet"],
            iconType: json["iconType"],
            isInitialBright: json["isInitialBright"],
            isIconSvg: json["isIconSVG"],
            isTranslucent: json["isTranslucent"],
            isStacked: json["isStacked"],
            hideChoiceLabelInSurvey: json["hideChoiceLabelInSurvey"],
            randomizeChoices: json["randomizeChoices"],
            mediaType: json["mediaType"],
            videoEmbedScript: json["videoEmbedScript"],
            quesImages: json["quesImages"] == null ? [] : List<HeadingImage>.from(json["quesImages"].map((x) => HeadingImage.fromJson(x) )),
            quizTimeout: json["quizTimeout"],
            id: json["_id"],
            choices: json["choices"] == null ? [] : List<Choice>.from(json["choices"]!.map((x) => Choice.fromJson(x))),
            companyId: json["companyId"],
            createdBy: json["createdBy"],
            createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
            modifiedBy: json["modifiedBy"],
            modifiedDate: DateTime.tryParse(json["modifiedDate"] ?? ""),
            options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
            preMongifiedId: json["pre_mongified_id"],
            surveyId: json["surveyId"],
            translations:json["translations"]==null?null: Map.from(json["translations"]).map((k, v) => MapEntry<String, FieldTranslation>(k, FieldTranslation.fromJson(v))),
        );
    }

}
