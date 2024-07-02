

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down_item.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/manager/drop_down_manager.dart';

class Dropdown extends StatefulWidget {
  final double itemheight;
  const Dropdown({super.key, required this.itemheight});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final dropDownController = Get.find<DropDownManager>();
  
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
            separatorBuilder: (context, index) => const Divider(),
            itemCount: dropDownController.items.length,
            itemBuilder: (context, index) {
              return DropDownItem(text: dropDownController.items[index]);
            }),
      ),
    );
  }
}
