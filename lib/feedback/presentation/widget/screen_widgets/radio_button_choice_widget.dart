import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';

class RadioButtonWidget extends StatefulWidget {
  final Field field;
  const RadioButtonWidget({super.key, required this.field});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int _selectedValue = 0;
    final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  
  
  @override
  Widget build(BuildContext context) {
    print(widget.field.choices.length);
    return FormField(
      validator: (value) {
        return widget.field.fieldName;
      },
      builder: (context) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            childAspectRatio: 4, // Aspect ratio of each grid item
            mainAxisSpacing: 10.0, // Space between the items vertically
            crossAxisSpacing: 10.0, // Space between the items horizontally
          ),
          itemCount: widget.field.choices.length, // Total number of items
          itemBuilder: (context, index) {
            return CustomRadioButton(
              value: index,
              groupValue: _selectedValue,
              field: widget.field,
            choiceName: widget.field.choices[index].translations[surveyFieldController
                                  .defaultTranslation.value]?.name??"",
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            );
          },
        );
      }
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final Field field;
  final String choiceName;
  final ValueChanged<int?> onChanged;

  const CustomRadioButton({super.key, 
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.field,
    required this.choiceName
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color: groupValue == value ? Colors.black : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Radio<int>(
              fillColor: WidgetStateProperty.all(groupValue == value ? Colors.white : Colors.black),
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(
          choiceName,
              style: TextStyle(
                color: groupValue == value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
