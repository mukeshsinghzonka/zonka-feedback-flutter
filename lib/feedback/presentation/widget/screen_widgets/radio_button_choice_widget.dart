import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

class RadioButtonWidget extends StatefulWidget {
  final Field field;
  const RadioButtonWidget({super.key, required this.field});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        childAspectRatio: 4, // Aspect ratio of each grid item
        mainAxisSpacing: 10.0, // Space between the items vertically
        crossAxisSpacing: 10.0, // Space between the items horizontally
      ),
      itemCount: 10, // Total number of items
      itemBuilder: (context, index) {
        return CustomRadioButton(
          value: index,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        );
      },
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(validator: (value) {
      print("CustomRadioButton");
    }, builder: (context) {
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
                fillColor: WidgetStateProperty.all(
                    groupValue == value ? Colors.white : Colors.black),
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              Text(
                'Choice $value',
                style: TextStyle(
                  color: groupValue == value ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
