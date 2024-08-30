import 'dart:convert';

import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/form_validator.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class ValidationLogicManager {
  final Field field;
  final SurveyDesignFieldController _surveyDesignFieldController = Get.find<SurveyDesignFieldController>();
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

  int? getRangeValue(bool isMultiple) {

    if (field.specialSettingVal == 'range') {
      return int.parse(field.specialSettingVal2![2]);
    } else if (field.specialSettingVal == 'exact') {
      return int.parse(field.specialSettingVal3 ?? "0");
    }
    else if(isMultiple==false){
      return 1;
    }
    return null;
  }

  String? inputTextValidation(String? value) {
    String pattern = field.validateRegex!.trim();
  
    if (value == null || value.isEmpty && field.required == true) {
      FormValidator formValidator = FormValidator(
          value: ScreenValidationErrorType.REQUIRED,
          formId: field.id ?? "",
          message: 'Please enter some text');
      return jsonEncode(formValidator.toJson());
    }
    if (!RegExp(pattern).hasMatch(value)) {
      FormValidator formValidator = FormValidator(value: ScreenValidationErrorType.REQUIRED,
          formId: field.id ?? "",  message: field
                  .translations![
                      _surveyDesignFieldController.defaultTranslation.value]!
                  .invalidFieldMessage ??
              "");
      return jsonEncode(formValidator.toJson());
    }
    return null;
  }
}
