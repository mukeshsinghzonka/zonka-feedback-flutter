
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

class SurveyScreen {
    SurveyScreen({
        required this.screenSequenceOrder,
        required this.columnLayout,
        required this.fields,
    });

    final int? screenSequenceOrder;
    final String? columnLayout;
    final List<Field> fields;

    factory SurveyScreen.fromJson(Map<String, dynamic> json){ 
        return SurveyScreen(
            screenSequenceOrder: json["screenSequenceOrder"],
            columnLayout: json["columnLayout"],
            fields: json["fields"] == null ? [] : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
        );
    }

}