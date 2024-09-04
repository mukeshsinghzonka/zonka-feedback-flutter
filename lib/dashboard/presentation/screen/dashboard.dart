import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/bottomnavigation/presentation/bottom_navigation_bar.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/dashboard_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/bottom_app_widget.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/schedule_demo_widget.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/warning_widget.dart';
import 'package:zonka_feedback/drawer/drawer_screen.dart';
import 'package:zonka_feedback/services/api_call_handling.dart';
import 'package:zonka_feedback/surveys/presentation/survey_screen.dart';
import 'package:zonka_feedback/template/presentation/template.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

import 'package:zonka_feedback/utils/image_constant.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashboardController = Get.put(DashboardController());
  final workspaceController = Get.put(WorkspaceController());

  late double height, width, xPosition, yPosition;
  String workspaceName= "WorkSpace";
  @override
  void initState() {
    dashBoardApiCall();
    super.initState();
  }

  void dashBoardApiCall(){
    WidgetsBinding.instance.addPostFrameCallback((_){
    ApiCallHandling(
        controller: dashboardController,
        status: ApiCallStatus.Initial,
        sendParams: false,
        dialogBoxtitle: 'Updating...',
        success: () {
        }).handleApiCall();
    });
  }

  final GlobalKey _actionKey = GlobalKey();

  void findDropdownData() {
    RenderBox renderBox = _actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          key: _actionKey,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  ImageConstant.drawerIcon,
                  width: 20.w,
                  height: 20.h,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                  if (dashboardController.overlayController.isShowing) {
                    dashboardController.overlayController.hide();
                  }
                }),
          ),
          title: GestureDetector(
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
                              itemCount:
                                  workspaceController.workspaceList.length,
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
                Text(
                   workspaceName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: ConstantSize.medium_3),
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
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTemplateScreen())).then((value){
                          if(value!=null &&  value){
    ApiCallHandling(
        controller: dashboardController,
        status: ApiCallStatus.Initial,
        sendParams: false,
          dialogBoxtitle: 'Updating...',
       
        success: () {
      
        }).handleApiCall();
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
                    size: 17.sp,
                    color: Colors.white,
                    weight: 40.w,
                  )),
            ),
          ],
          centerTitle: true,
          backgroundColor: const Color(ColorConstant.themeColor)),
      drawer: const DrawerScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const BottomNavigationBarWidget(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                WarningWidget(),
                const ScheduleDemoWidget(),
                const SurveyScreen()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
