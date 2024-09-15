
import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/display_logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/filed_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/heading_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/option_model.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'field_model.g.dart';


@HiveType(typeId: HiveTypeId.fieldModelId)
class Field  extends HiveObject{
   @HiveField(0)
  final Logic? logic;

  @HiveField(1)
  final String? screenType;

  @HiveField(2)
  final bool? required;

  @HiveField(3)
  final bool? isRating;

  @HiveField(4)
  final bool? includeInCsat;

  @HiveField(5)
  final bool? includeForAnalysis;

  @HiveField(6)
  final String? validateRegex;

  @HiveField(7)
  final String? paramId;

  @HiveField(8)
  final String? fieldName;

  @HiveField(9)
  final String? fieldCategory;

  @HiveField(10)
  final int? sequenceOrder;

  @HiveField(11)
  final int? screenSequenceOrder;

  @HiveField(12)
  final String? displayLayout;

  @HiveField(13)
  final String? choiceLayout;

  @HiveField(14)
  final bool? isButtonColored;

  @HiveField(15)
  final String? buttonStyle;

  @HiveField(16)
  final String? positiveOptionDirection;

  @HiveField(17)
  final String? helpTextPlacement;

  @HiveField(18)
  final bool? hideField;

  @HiveField(19)
  final bool? hideFieldInDevice;

  @HiveField(20)
  final bool? isNaChoiceVisible;

  @HiveField(21)
  final bool? isPrimaryField;

  @HiveField(22)
  final String? specialSettingVal;

  @HiveField(23)
  final String? specialSettingVal2;

  @HiveField(24)
  final String? specialSettingVal3;

  @HiveField(25)
  final String? specialSettingVal4;

  @HiveField(26)
  final String? specialSettingVal5;

  @HiveField(27)
  final bool? choicesHasImage;

  @HiveField(28)
  final bool? isLastChoiceNa;

  @HiveField(29)
  final List<DisplayLogicModel> displayLogic;

  @HiveField(30)
  final String? displayLogicExpression;

  @HiveField(31)
  final int? iconSet;

  @HiveField(32)
  final String? iconType;

  @HiveField(33)
  final bool? isInitialBright;

  @HiveField(34)
  final bool? isIconSvg;

  @HiveField(35)
  final bool? isTranslucent;

  @HiveField(36)
  final bool? isStacked;

  @HiveField(37)
  final bool? hideChoiceLabelInSurvey;

  @HiveField(38)
  final bool? randomizeChoices;

  @HiveField(39)
  final String? mediaType;

  @HiveField(40)
  final String? videoEmbedScript;

  @HiveField(41)
  final List<HeadingImage> quesImages;

  @HiveField(42)
  final int? quizTimeout;

  @HiveField(43)
  final String? id;

  @HiveField(44)
  final List<Choice> choices;

  @HiveField(45)
  final String? companyId;

  @HiveField(46)
  final String? createdBy;

  @HiveField(47)
  final DateTime? createdDate;

  @HiveField(48)
  final String? modifiedBy;

  @HiveField(49)
  final DateTime? modifiedDate;

  @HiveField(50)
  final List<Option> options;

  @HiveField(51)
  final int? preMongifiedId;

  @HiveField(52)
  final String? surveyId;

  @HiveField(53)
  final Map<String, FieldTranslation>? translations;

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
    required this.displayLogic,
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

    factory Field.fromJson(Map<String, dynamic> ?json){ 
        if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }

        return Field(
            displayLogic: json["displayLogic"] == null ? [] : List<DisplayLogicModel>.from(json["displayLogic"]!.map((x) => DisplayLogicModel.fromJson(x))),
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
