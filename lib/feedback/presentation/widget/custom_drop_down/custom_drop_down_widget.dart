import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down_item.dart';

class CustomDropDownWidget<T> extends StatefulWidget {
  final String text;
  final List<DropDownItem<T>> items;

  const CustomDropDownWidget({super.key, required this.text, required this.items});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState<T> extends State<CustomDropDownWidget<T>> {

 var dropDownController ;

 @override
  void initState() {
    // print("initstate $T");
    // dropDownController = Get.put(DropDownManager<T>(items: widget.items));
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        dropDownController.dropDownItem(context);
      },
      child: Center(
        child: Container(
         key: dropDownController.actionKey,
          height: 35.h,
          width: 250.w,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.text),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}


