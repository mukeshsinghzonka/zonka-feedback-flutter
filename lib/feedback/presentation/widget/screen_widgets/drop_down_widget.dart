import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/custom_drop_down_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down_item.dart';

class DropDownWidget extends StatefulWidget {
  final Field field;
  const DropDownWidget({super.key, required this.field});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        return widget.field.fieldName;
      },
      builder: (context) {
        return CustomDropDownWidget<String>(
          text: 'Call To Action',
          items: <String>['A','B','C'].map((String value) {
            return DropDownItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String ?value) {
            print(value);
          },
        );
      }
    );


  }
}

class CheckModel {
  final String value;
  final bool isChecked;

  CheckModel({required this.value, required this.isChecked});
}
