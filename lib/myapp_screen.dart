


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zonka_feedback/dashboard/presentation/dashboard.dart';
import 'package:zonka_feedback/login/presentation/screens/login_screen.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child) {
        return MaterialApp(
          title: 'Flutter Demo',
           navigatorKey:NavigationService.navigatorKey,
           navigatorObservers: [FlutterSmartDialog.observer],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(ColorConstant.themeColor) ),
            useMaterial3: true,
          ),
          home:  LoginScreen()
        );
      }
    );
  }
}
