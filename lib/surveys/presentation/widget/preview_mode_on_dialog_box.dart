import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class PreviewModeOnDialogBox extends StatefulWidget {
  const PreviewModeOnDialogBox({super.key});

  @override
  State<PreviewModeOnDialogBox> createState() => _PreviewModeOnDialogBoxState();
}

class _PreviewModeOnDialogBoxState extends State<PreviewModeOnDialogBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 3.4,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
             Expanded(
               child: Text(
                "You are starting the Preview Survey mode. It makes easy for you to test the survey you have activated using the Zonka Feedback Survey Builder.",
                textAlign: TextAlign.center,
                           ),
             ),

             Expanded(
               child: Text(
                'Any information and response captured during this will not be saved.',
                textAlign: TextAlign.center,
                           ),
             ),

             Expanded(
               child: Text(
                'Are you sure you want to continue ?',
                textAlign: TextAlign.center,
                           ),
             ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(ColorConstant.themeColor)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Color(ColorConstant.themeColor))),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
