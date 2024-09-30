import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/global_value_notifier.dart';

class PreViewSurveyWidget extends StatefulWidget {
  const PreViewSurveyWidget({super.key});

  @override
  State<PreViewSurveyWidget> createState() => _PreViewSurveyWidgetState();
}

class _PreViewSurveyWidgetState extends State<PreViewSurveyWidget> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preview Survey',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        'Preview your survey before capturing responses.',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.grey.shade500,
                            fontSize: 8.sp),
                      ),
                      Text('No responses will be saved during the preivew.',
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.grey.shade500,
                              fontSize: 8.sp)),
                      Text(
                          'Remember to switch preview off once you’re done testing and are ready to capture response.',
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.grey.shade500,
                              fontSize: 8.sp))
                    ],
                  ),
                ),
                Switch(
                  onChanged: (data){
                    isPreviewModeOn.value = data;
                    setState(() {

                    });
                  },
                  value:   isPreviewModeOn.value,
                  activeColor: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
