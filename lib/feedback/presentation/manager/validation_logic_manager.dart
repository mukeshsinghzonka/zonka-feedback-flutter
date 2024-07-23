import 'dart:convert';

import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/form_validator.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class ValidationLogicManager {
  final Field field;

  ValidationLogicManager({required this.field});

  String? rangeValidator(int count) {
    FormValidator formValidator = FormValidator(
      value: ScreenValidationErrorType.WRONGSELECTION,
      formId: field.id ?? "",
    );
    int minVal = int.parse(field.specialSettingVal2![0]);
    int maxVal = int.parse(field.specialSettingVal2![2]);
    if (count < minVal || count > maxVal) {
      return jsonEncode(formValidator.toJson());
    }
    return null;
  }

  String? requiredFormValidator(bool isTrue) {
    if (isTrue) {
      FormValidator formValidator = FormValidator(
        value: ScreenValidationErrorType.REQUIRED,
        formId: field.id ?? "",
      );
      return jsonEncode(formValidator.toJson());
    }
    return null;
  }

  String? exactFormValidator(int count) {
    FormValidator formValidator = FormValidator(
      value: ScreenValidationErrorType.WRONGSELECTION,
      formId: field.id ?? "",
    );
    int exactVal = int.parse(field.specialSettingVal3 ?? "0");
    if (count != exactVal) {
      return jsonEncode(formValidator.toJson());
    }

    return null;
  }

  int? getRangeValue() {
    if (field.specialSettingVal == 'range') {
      return int.parse(field.specialSettingVal2![2]);
    } else if (field.specialSettingVal == 'exact') {
      return int.parse(field.specialSettingVal3 ?? "0");
    }
    return null;
  }
}
