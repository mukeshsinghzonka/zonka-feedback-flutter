import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class LegalWidget extends StatefulWidget {
  const LegalWidget({super.key});

  @override
  State<LegalWidget> createState() => _LegalWidgetState();
}

class _LegalWidgetState extends State<LegalWidget> {
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        
      },
      builder: (context) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.h),
              child: TextFormField(
                controller: TextEditingController(
                    text: "jdfbckjfebvebvkejbvkjebvkjebvkjebvkhxkjdcjkcbkjbcekjcbkjechbkecnkenjcs"),
                maxLines: 3,
                readOnly: true,
                decoration: const  InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(ColorConstant.surveyInputColor)),
                  ),
                  focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color(ColorConstant.surveyInputColor)),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio<int>(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (int? value) {
                          groupValue = value;
                          setState(() {});
                        }),
                    const Text('I agree to the terms and conditions')
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (int? value) {
                          groupValue = value;
                          setState(() {});
                        }),
                    const Text('I agree to the terms and conditions')
                  ],
                ),
              ],
            )
          ],
        );
      }
    );
  }
}
