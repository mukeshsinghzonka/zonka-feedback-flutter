import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
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
                flex: 1,
                child: SizedBox(
                  width: size.width,
                  child: CachedNetworkImage(
                    imageUrl: widget.templateModel.thumbnailImage ?? '',
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                )),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Text(
                    widget.templateModel.surveyId!.name ?? "",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      flex: 2,
                      child: Text(
                          widget.templateModel.surveyId!.description ?? '',
                          textAlign: TextAlign.center)),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      alignment: Alignment.center,
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
                ),
                SizedBox(
                  width: 5.h,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: const Color(ColorConstant.themeColor))),
                      child: const Text(
                        'Add Survey',
                        style:
                            TextStyle(color: Color(ColorConstant.themeColor)),
                      ),
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
