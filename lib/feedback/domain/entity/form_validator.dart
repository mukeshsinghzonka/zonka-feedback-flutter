import 'package:zonka_feedback/utils/enum_util.dart';

class FormValidator{

  final ScreenValidationErrorType value;
  final String formId;

  FormValidator({required this.value, required this.formId});

  factory FormValidator.fromJson(Map<String, dynamic> ?  json){
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }
    return FormValidator(
      value: ScreenValidationErrorType.values.firstWhere((e) => e.toString() == json['value']),
      formId: json['formId']
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'value': value.toString(),
      'formId': formId
    };
  }


}

