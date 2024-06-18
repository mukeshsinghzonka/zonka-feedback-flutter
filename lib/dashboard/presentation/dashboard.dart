import 'package:flutter/material.dart';
import 'package:zonka_feedback/appbar/presentation/app_bar.dart';
import 'package:zonka_feedback/bottomnavigation/presentation/bottom_navigation_bar.dart';
import 'package:zonka_feedback/dashboard/widget/schedule_demo_widget.dart';
import 'package:zonka_feedback/dashboard/widget/warning_widget.dart';
import 'package:zonka_feedback/drawer/drawer_screen.dart';
import 'package:zonka_feedback/surveys/presentation/survey_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
