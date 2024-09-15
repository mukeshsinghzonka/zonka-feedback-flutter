// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FieldAdapter extends TypeAdapter<Field> {
  @override
  final int typeId = 10;

  @override
  Field read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Field(
      logic: fields[0] as Logic?,
      screenType: fields[1] as String?,
      required: fields[2] as bool?,
      isRating: fields[3] as bool?,
      includeInCsat: fields[4] as bool?,
      includeForAnalysis: fields[5] as bool?,
      validateRegex: fields[6] as String?,
      paramId: fields[7] as String?,
      fieldName: fields[8] as String?,
      fieldCategory: fields[9] as String?,
      sequenceOrder: fields[10] as int?,
      screenSequenceOrder: fields[11] as int?,
      displayLayout: fields[12] as String?,
      choiceLayout: fields[13] as String?,
      isButtonColored: fields[14] as bool?,
      buttonStyle: fields[15] as String?,
      positiveOptionDirection: fields[16] as String?,
      helpTextPlacement: fields[17] as String?,
      hideField: fields[18] as bool?,
      hideFieldInDevice: fields[19] as bool?,
      isNaChoiceVisible: fields[20] as bool?,
      isPrimaryField: fields[21] as bool?,
      specialSettingVal: fields[22] as String?,
      specialSettingVal2: fields[23] as String?,
      specialSettingVal3: fields[24] as String?,
      specialSettingVal4: fields[25] as String?,
      specialSettingVal5: fields[26] as String?,
      choicesHasImage: fields[27] as bool?,
      isLastChoiceNa: fields[28] as bool?,
      displayLogic: (fields[29] as List).cast<DisplayLogicModel>(),
      displayLogicExpression: fields[30] as String?,
      iconSet: fields[31] as int?,
      iconType: fields[32] as String?,
      isInitialBright: fields[33] as bool?,
      isIconSvg: fields[34] as bool?,
      isTranslucent: fields[35] as bool?,
      isStacked: fields[36] as bool?,
      hideChoiceLabelInSurvey: fields[37] as bool?,
      randomizeChoices: fields[38] as bool?,
      mediaType: fields[39] as String?,
      videoEmbedScript: fields[40] as String?,
      quesImages: (fields[41] as List).cast<HeadingImage>(),
      quizTimeout: fields[42] as int?,
      id: fields[43] as String?,
      choices: (fields[44] as List).cast<Choice>(),
      companyId: fields[45] as String?,
      createdBy: fields[46] as String?,
      createdDate: fields[47] as DateTime?,
      modifiedBy: fields[48] as String?,
      modifiedDate: fields[49] as DateTime?,
      options: (fields[50] as List).cast<Option>(),
      preMongifiedId: fields[51] as int?,
      surveyId: fields[52] as String?,
      translations: (fields[53] as Map?)?.cast<String, FieldTranslation>(),
    );
  }

  @override
  void write(BinaryWriter writer, Field obj) {
    writer
      ..writeByte(54)
      ..writeByte(0)
      ..write(obj.logic)
      ..writeByte(1)
      ..write(obj.screenType)
      ..writeByte(2)
      ..write(obj.required)
      ..writeByte(3)
      ..write(obj.isRating)
      ..writeByte(4)
      ..write(obj.includeInCsat)
      ..writeByte(5)
      ..write(obj.includeForAnalysis)
      ..writeByte(6)
      ..write(obj.validateRegex)
      ..writeByte(7)
      ..write(obj.paramId)
      ..writeByte(8)
      ..write(obj.fieldName)
      ..writeByte(9)
      ..write(obj.fieldCategory)
      ..writeByte(10)
      ..write(obj.sequenceOrder)
      ..writeByte(11)
      ..write(obj.screenSequenceOrder)
      ..writeByte(12)
      ..write(obj.displayLayout)
      ..writeByte(13)
      ..write(obj.choiceLayout)
      ..writeByte(14)
      ..write(obj.isButtonColored)
      ..writeByte(15)
      ..write(obj.buttonStyle)
      ..writeByte(16)
      ..write(obj.positiveOptionDirection)
      ..writeByte(17)
      ..write(obj.helpTextPlacement)
      ..writeByte(18)
      ..write(obj.hideField)
      ..writeByte(19)
      ..write(obj.hideFieldInDevice)
      ..writeByte(20)
      ..write(obj.isNaChoiceVisible)
      ..writeByte(21)
      ..write(obj.isPrimaryField)
      ..writeByte(22)
      ..write(obj.specialSettingVal)
      ..writeByte(23)
      ..write(obj.specialSettingVal2)
      ..writeByte(24)
      ..write(obj.specialSettingVal3)
      ..writeByte(25)
      ..write(obj.specialSettingVal4)
      ..writeByte(26)
      ..write(obj.specialSettingVal5)
      ..writeByte(27)
      ..write(obj.choicesHasImage)
      ..writeByte(28)
      ..write(obj.isLastChoiceNa)
      ..writeByte(29)
      ..write(obj.displayLogic)
      ..writeByte(30)
      ..write(obj.displayLogicExpression)
      ..writeByte(31)
      ..write(obj.iconSet)
      ..writeByte(32)
      ..write(obj.iconType)
      ..writeByte(33)
      ..write(obj.isInitialBright)
      ..writeByte(34)
      ..write(obj.isIconSvg)
      ..writeByte(35)
      ..write(obj.isTranslucent)
      ..writeByte(36)
      ..write(obj.isStacked)
      ..writeByte(37)
      ..write(obj.hideChoiceLabelInSurvey)
      ..writeByte(38)
      ..write(obj.randomizeChoices)
      ..writeByte(39)
      ..write(obj.mediaType)
      ..writeByte(40)
      ..write(obj.videoEmbedScript)
      ..writeByte(41)
      ..write(obj.quesImages)
      ..writeByte(42)
      ..write(obj.quizTimeout)
      ..writeByte(43)
      ..write(obj.id)
      ..writeByte(44)
      ..write(obj.choices)
      ..writeByte(45)
      ..write(obj.companyId)
      ..writeByte(46)
      ..write(obj.createdBy)
      ..writeByte(47)
      ..write(obj.createdDate)
      ..writeByte(48)
      ..write(obj.modifiedBy)
      ..writeByte(49)
      ..write(obj.modifiedDate)
      ..writeByte(50)
      ..write(obj.options)
      ..writeByte(51)
      ..write(obj.preMongifiedId)
      ..writeByte(52)
      ..write(obj.surveyId)
      ..writeByte(53)
      ..write(obj.translations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
