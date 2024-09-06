import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/setting/presentation/settings_screen.dart';
import 'package:zonka_feedback/surveys/presentation/survey_screen.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class DrawerScreenManagerNotifier extends GetxController {
  final Rx<DrawerScreenType> _drawerScreenType = DrawerScreenType.surveyScreen.obs;
  Rx<DrawerScreenType> get drawerScreenType => _drawerScreenType;
  void drawerScreenSet(DrawerScreenType value, BuildContext context) {
    Navigator.of(context).pop();
    _drawerScreenType.value = value;
    update();
  }

  Widget getDrawerScreen(DrawerScreenType drawerScreenType) {
    switch (drawerScreenType) {
      case DrawerScreenType.surveyScreen:
        return const SurveyScreen();
      case DrawerScreenType.settingScreen:
      return const SettingScreen();
      default:
        return Container();
    }  
  }
  

}
