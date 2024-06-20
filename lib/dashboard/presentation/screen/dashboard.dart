import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/appbar/presentation/app_bar.dart';
import 'package:zonka_feedback/bottomnavigation/presentation/bottom_navigation_bar.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/schedule_demo_widget.dart';
import 'package:zonka_feedback/dashboard/presentation/widget/warning_widget.dart';
import 'package:zonka_feedback/drawer/drawer_screen.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_controller.dart';
import 'package:zonka_feedback/surveys/presentation/survey_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final locationController = Get.put(LocationController());
  final workSpaceController = Get.put(WorkspaceController());  
 final surveyController = Get.put(SurveyController());
  @override
  void initState() {
    
showlenght();
    super.initState();
  }

  void showlenght()async{
await locationController.call();
    await workSpaceController.call();
    await surveyController.call();
    print("locationcontroller: ${locationController.locationList.length} workSpaceController: ${workSpaceController.workspaceList.length}");
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                WarningWidget(),
                ScheduleDemoWidget(),
                SurveyScreen()
              ],
            ),
            BottomNavigationBarWidget()
          ],
        ),
      ),
    );
  }
}
