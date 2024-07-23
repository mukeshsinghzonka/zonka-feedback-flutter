

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/manager/drop_down_manager.dart';

class DropDownItem<T> extends StatelessWidget {
 
  final Widget child;
  final T value;
  const DropDownItem({super.key, required this.child, required this.value});
  // final dropDownController = Get.put(DropDownManager<T>(
  //   items: [
      
  //   ],
  // ));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // dropDownController.dropDownItem(context);
      },
      child: child
    );
  }
}
