

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down_item.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/manager/drop_down_manager.dart';

class Dropdown<T> extends StatefulWidget {
  final double itemheight;
  const Dropdown({super.key, required this.itemheight});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  final dropDownController = Get.find<DropDownManager<T>>();
  
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListView.separated(
          padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(),
            itemCount: dropDownController.items.length,
            itemBuilder: (context, index) {
              return DropDownItem(value: dropDownController.items[index].value, child: dropDownController.items[index].child);
            }),
      ),
    );
  }
}
