import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down.dart';
import 'package:zonka_feedback/feedback/presentation/widget/custom_drop_down/drop_down_item.dart';

class DropDownManager<T> extends GetxController {


  DropDownManager({required List<DropDownItem<T>> items}){
    setitems(items);
  }

  late List<DropDownItem<T> > items = [];
 
  void setitems(List<DropDownItem<T>> value) {
    items = value;
    update();
    print("Items updated: $items"); 
  }
  late double height, width, xPosition, yPosition;
  late OverlayEntry _overlayFloatingEntry;

  RxBool isDropDownOpen = false.obs;

  
  void toggleDropDown() {
    isDropDownOpen.value = !isDropDownOpen.value;
  }

  final GlobalKey _actionKey = GlobalKey();
  GlobalKey get actionKey => _actionKey;

  void findDropdownData() {
    RenderBox renderBox = _actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

 OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: xPosition,
          width: width,
          top: yPosition + height,
          height: 100.h,
          child: Dropdown<T>(
            itemheight: 40.0,
          ));
    });
  }

  void dropDownItem(BuildContext context) {
    if (isDropDownOpen.value) {
      _overlayFloatingEntry.remove();
    } else {
       findDropdownData();
      _overlayFloatingEntry = _createFloatingDropdown();
      Overlay.of(context).insert(_overlayFloatingEntry);
    }
    toggleDropDown();
  }


}
