import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/manager/drop_down_manager.dart';

class CustomDropDownWidget extends StatefulWidget {
  final String text;
  final List<String>? items;
  const CustomDropDownWidget({super.key, required this.text, required this.items});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {

 late final dropDownController;
 @override
  void initState() {
    dropDownController = Get.put(DropDownManager(items: widget.items));
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: dropDownController.actionKey,
      onTap: (){
        dropDownController.dropDownItem(context);
      },
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}


