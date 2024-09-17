

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/dashboard_controller.dart';
import 'package:zonka_feedback/services/api_call_handling.dart';
import 'package:zonka_feedback/template/presentation/template.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class AddTemplateWidget extends StatelessWidget {
   AddTemplateWidget({super.key});
 final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddTemplateScreen()))
                    .then((value) {
                  if (value != null && value) {
                    ApiCallHandling(
                            controller: dashboardController,
                            status: ApiCallStatus.Initial,
                            sendParams: false,
                            dialogBoxtitle: 'Updating...',
                            success: () {})
                        .handleApiCall();
                  }
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.w)),
                  child: Icon(
                    Icons.add,
                    size:20.sp,
                    color: Colors.white,
                    weight: 40.w,
                  )),
            );
  }
}