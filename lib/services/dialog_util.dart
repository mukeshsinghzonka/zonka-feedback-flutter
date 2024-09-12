import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();
  DialogUtils.internal();
  factory DialogUtils() => _instance;
  
  static void showCustomLoadingDialog(BuildContext context, String dialogBoxtitle) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: EdgeInsets.all(15.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Container(
              height: 60.h,
              width: 300.w,
              margin: EdgeInsets.only(left: 20.w),
              alignment: Alignment.center,
              child: Row(
                children: [
                  CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 4.w,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    dialogBoxtitle,
                    style: TextStyle(fontSize: 13.h),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showCustomErrorDialog(BuildContext context, {required String title,}) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: EdgeInsets.all(15.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            child: Container(
              height: 90.h,
              width: 350.w,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 11.h, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 13.h, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



   static void showCustomDialogBox(BuildContext context,
   {required String title, required  String leftButtonTitle, required String rightButtonTitle, })
   {
 showDialog(
        context: context,
        builder: (_) {
          return Dialog(
          
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            child: Container(
              height: 90.h,
              padding: EdgeInsets.all(10.h),
              width: 350.w,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 13.h, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            leftButtonTitle,
                            style: TextStyle(fontSize: 10.h, color: Color(ColorConstant.themeColor)),
                          ),
                        ),
                         GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            rightButtonTitle,
                              style: TextStyle(fontSize: 10.h, color: Color(ColorConstant.themeColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            ),
            ),
          );
        });
   }



}
