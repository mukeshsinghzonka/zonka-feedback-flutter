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


static Future<bool?> showCustomDialogBox(
    BuildContext context, {
    required String title,
    required String leftButtonTitle,
    required String rightButtonTitle,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) {
        Size size = MediaQuery.of(context).size;
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Container(
            height: 90,
            padding: EdgeInsets.all(10),
            width: 350,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(true); // Return `true` on left button tap
                        },
                        child: Text(
                          leftButtonTitle,
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            color: const Color(0xFF00ACC1), // Replace with theme color
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(false); // Return `false` on right button tap
                        },
                        child: Text(
                          rightButtonTitle,
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            color: const Color(0xFF00ACC1), // Replace with theme color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}
