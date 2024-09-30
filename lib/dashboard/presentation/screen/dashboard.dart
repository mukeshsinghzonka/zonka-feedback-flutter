import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:zonka_feedback/bottomnavigation/presentation/bottom_navigation_bar.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/dashboard_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/screen/widget/add_template_widget.dart';
import 'package:zonka_feedback/dashboard/presentation/screen/widget/appbar_workspace.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/schedule_demo_widget.dart';
import 'package:zonka_feedback/drawer/drawer_screen.dart';
import 'package:zonka_feedback/drawer/manager/drawer_screen_manager.dart';
import 'package:zonka_feedback/services/api_call_handling.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

import '../../../feedback/presentation/manager/survery_api_feedback_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashboardController = Get.put(DashboardController());
  final DrawerScreenManagerNotifier drawerScreenManagerNotifier =
      Get.put(DrawerScreenManagerNotifier());
  final SurveryApiFeedbackController surveryApiFeedbackController =
      Get.find<SurveryApiFeedbackController>();

  @override
  void initState() {
    // Isolate.spawn(drawerScreenManagerNotifier.isolateEntryPoint, receivePort.sendPort);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiCallHandling(
              controller: dashboardController,
              status: ApiCallStatus.Initial,
              sendParams: false,
              dialogBoxtitle: 'Updating...',
              success: () {})
          .handleApiCall();
    });

    super.initState();
  }

  final GlobalKey _actionKey = GlobalKey();
  final Stream<KioskMode> _currentMode = watchKioskMode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: _currentMode,
        builder: (context, snapShot) {
          return Stack(
            children: [
              Scaffold(
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
                            if (dashboardController
                                .overlayController.isShowing) {
                              dashboardController.overlayController.hide();
                            }
                          }),
                    ),
                    title: AppBarWorkSpace(
                      actionKeyValue: _actionKey,
                    ),
                    actions: [AddTemplateWidget()],
                    centerTitle: true,
                    backgroundColor: const Color(ColorConstant.themeColor)),
                drawer: DrawerScreen(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: const BottomNavigationBarWidget(),
                body: CustomScrollView(
                  slivers: [
                    // WarningWidget(),SliverPersistentHeader
                    // SliverPersistentHeader(
                    //   pinned: true,
                    //   delegate: WarningWidget(),
                    // ),
                    // SliverPersistentHeader(
                    //   pinned: true,
                    //   delegate: ScheduleDemoWidget(),
                    // ),
                    //

                    SliverToBoxAdapter(
                      child: Obx(() {
                        return drawerScreenManagerNotifier.getDrawerScreen(
                            drawerScreenManagerNotifier.drawerScreenType.value);
                      }),
                    )
                  ],
                ),
              ),
              Positioned(
                top: size.height / 4.5,
                right: size.width / 10,
                child: Container(
                  decoration: BoxDecoration(
                    color:const  Color(ColorConstant.themeColor),
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: size.width / 80, horizontal: size.height / 50),
                  child: const Text(
                    "1353 Updates Available",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
