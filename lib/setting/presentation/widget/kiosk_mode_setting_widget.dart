import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

class KioskModeSettingWidget extends StatefulWidget {
  const KioskModeSettingWidget({super.key});

  @override
  State<KioskModeSettingWidget> createState() => _KioskModeSettingWidgetState();
}

class _KioskModeSettingWidgetState extends State<KioskModeSettingWidget> {
  bool isSwitched = false;

  Future<void> toggleSwitch(bool value) async {
    if (isSwitched == false) {
      await startKioskMode();
      setState(() {
        isSwitched = true;
      });
    } else {
      await stopKioskMode();
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  void initState() {
    getKioskModeValue();
    super.initState();
  }

  Future<void> getKioskModeValue() async {
    KioskMode value = await getKioskMode();

    if (value == KioskMode.enabled) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
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
                        'Kiosk Mode Settings',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Enabling this mode will activate the following restriction :',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.grey.shade500,
                            fontSize: 8.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          '- Back button will eb disabled within the  Zonka App',
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.grey.shade500,
                              fontSize: 8.sp)),
                      Text(
                          '- Short pressing or long pressing of te power button will not lock the device and the app will come into forground automatically.',
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.grey.shade500,
                              fontSize: 8.sp)),
                      Text(
                          '- Pressing the Home button will show the home screen temporally before bringing he Zonka app to foreground automatically.',
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.grey.shade500,
                              fontSize: 8.sp)),
                    ],
                  ),
                ),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
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
