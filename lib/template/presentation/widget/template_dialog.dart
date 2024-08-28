import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class PreviewTemplateDialogBox extends StatefulWidget {
  final TemplateModel templateModel;
  const PreviewTemplateDialogBox({super.key, required this.templateModel});

  @override
  State<PreviewTemplateDialogBox> createState() =>
      _PreviewTemplateDialogBoxState();
}

class _PreviewTemplateDialogBoxState extends State<PreviewTemplateDialogBox> {
   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: size.height * 0.4,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(ColorConstant.themeColor))),
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                    width: size.width,
                    child: SvgPicture.asset(ImageConstant.zonkaDrawerLogo))),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Text(widget.templateModel.surveyId!.name ?? "")),
                  Expanded(
                      flex: 2,
                      child: Text(
                          widget.templateModel.surveyId!.description ?? '')),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop(true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.w, horizontal: size.width * 0.1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: const Color(ColorConstant.themeColor),
                    ),
                    child: const Text(
                      'Preview',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.w, horizontal: size.width * 0.1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                            color: const Color(ColorConstant.themeColor))),
                    child: const Text(
                      'Add Survey',
                      style: TextStyle(color: Color(ColorConstant.themeColor)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
