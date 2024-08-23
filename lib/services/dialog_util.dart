import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();
  DialogUtils.internal();
  factory DialogUtils() => _instance;
  
  static void showCustomLoadingDialog(BuildContext context) {
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
                    "Verifying User",
                    style: TextStyle(fontSize: 13.h),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showCustomErrorDialog(
    BuildContext context, {
    required String title,
  }) {
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
}
