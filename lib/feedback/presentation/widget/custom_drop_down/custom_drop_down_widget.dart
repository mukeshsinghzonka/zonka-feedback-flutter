import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down_item.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/manager/drop_down_manager.dart';

class CustomDropDownWidget<T> extends StatefulWidget {
  final String text;
  final List<DropDownItem<T>> items;
  final ValueChanged<T?>? onChanged;
  const CustomDropDownWidget(
      {super.key,
      required this.text,
      required this.items,
      required this.onChanged});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState<T> extends State<CustomDropDownWidget<T>> {
  late DropDownManager<T> dropDownController;

  @override
  void initState() {
    super.initState();
    dropDownController = Get.put(DropDownManager<T>(
      items: widget.items,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
