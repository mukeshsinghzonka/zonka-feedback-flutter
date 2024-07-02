
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

class SurveyScreenModel {
    SurveyScreenModel({
        required this.screenSequenceOrder,
        required this.columnLayout,
        required this.fields,
    });

    final int? screenSequenceOrder;
    final String? columnLayout;
    final List<Field> fields;

    factory SurveyScreenModel.fromJson(Map<String, dynamic> json){ 
        return SurveyScreenModel(
            screenSequenceOrder: json["screenSequenceOrder"],
            columnLayout: json["columnLayout"],
            fields: json["fields"] == null ? [] : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
        );
    }

}