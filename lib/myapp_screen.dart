import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zonka_feedback/dashboard/presentation/screen/dashboard.dart';
import 'package:zonka_feedback/login/presentation/screens/login_screen.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: NavigationService.navigatorKey,
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(ColorConstant.themeColor)),
              useMaterial3: true,
            ),
            home: ValueListenableBuilder(
              valueListenable:
                  Hive.box(HiveDirectoryUtil.loginBox).listenable(),
              builder: (context, box, widget) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: box.get(HiveKey.loginUser) != null
                      ? const DashBoard(key: ValueKey('DashBoard'))
                      : const LoginScreen(key: ValueKey('LoginScreen')),
                );
              },
            ),
          );
        });
  }
}
