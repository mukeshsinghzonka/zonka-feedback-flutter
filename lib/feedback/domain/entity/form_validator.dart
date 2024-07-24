import 'package:zonka_feedback/utils/enum_util.dart';

class FormValidator{

  final ScreenValidationErrorType value;
  final String formId;
  final String ?message;
  FormValidator({required this.value, required this.formId,  this.message});

  factory FormValidator.fromJson(Map<String, dynamic> ?  json){
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }
    return FormValidator(
      value: ScreenValidationErrorType.values.firstWhere((e) => e.toString() == json['value']),
      formId: json['formId'],
      message: json['message']
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'value': value.toString(),
      'formId': formId,
      'message': message
    };
  }


}

