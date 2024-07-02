import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/custom_drop_down_widget.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40.h,
        child: CustomDropDownWidget(
                text:'Call To Action',
                items: ['Call To Action 1', 'Call To Action 2', 'Call To Action 3'],
              ),
      ),
    );
  }
}
