import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/dashboard_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/bottom_app_widget.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class AppBarWorkSpace extends StatefulWidget {
  final GlobalKey actionKeyValue;
  const AppBarWorkSpace({super.key, required this.actionKeyValue});

  @override
  State<AppBarWorkSpace> createState() => _AppBarWorkSpaceState();
}

class _AppBarWorkSpaceState extends State<AppBarWorkSpace> {
  late double height, width, xPosition, yPosition;
  String workspaceName = "WorkSpace";
  final dashboardController = Get.find<DashboardController>();
  final workspaceController = Get.put(WorkspaceController());

  void findDropdownData() {
    RenderBox renderBox =
        widget.actionKeyValue.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        findDropdownData();
        dashboardController.overlayController.toggle();
      },
      child: OverlayPortal(
        controller: dashboardController.overlayController,
        overlayChildBuilder: (context) {
          return Positioned(
              left: xPosition,
              width: width,
              top: yPosition + height,
              child: Column(
                children: [
                  Container(
                    color: const Color(ColorConstant.themeColor),
                    width: size.width,
                    height: 170.h,
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                        itemCount: workspaceController.workspaceList.length,
                        itemBuilder: (context, index) {
                          return WorkspacesList(
                            workspaceModel:
                                workspaceController.workspaceList[index],
                            onDataReceived: (p0) {
                              setState(() {
                                workspaceName = p0;
                              });
                            },
                          );
                        }),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(
              init: workspaceController,
              builder: (context) {
                return Container(
                  width: 150.w,
                  alignment: Alignment.center,
                  child: Text(
                      workspaceController.selectedWorkspace?.value.workSpaceName ??"",
                
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: ConstantSize.medium_2),
                  ),
                );
              }
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
                width: 13.h,
                height: 13.h,
                padding: EdgeInsets.all(3.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(ColorConstant.arrowBackgroundColor),
                ),
                child: SvgPicture.asset(
                  ImageConstant.arrowDownLogo,
                  width: 13.h,
                  height: 13.h,
                )),
          ],
        ),
      ),
    );
  }
}
