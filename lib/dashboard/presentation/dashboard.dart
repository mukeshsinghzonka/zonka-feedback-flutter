import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50.h,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Workspaces',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                  width: 15.h,
                  height: 15.h,
                  padding: EdgeInsets.all(3.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(ColorConstant.arrowBackgroundColor),
                  ),
                  child: SvgPicture.asset(
                    ImageConstant.arrowDownLogo,
                    width: 15.h,
                    height: 15.h,
                  )),
            ],
          ),
          actions: [
            Container(
                alignment: Alignment.center,
                height: 20.w,
                width: 20.w,
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.8.w)),
                child: Icon(
                  Icons.add,
                  size: 14.w,
                  color: Colors.white,
                  weight: 40.w,
                )),
          ],
          centerTitle: true,
          backgroundColor: const Color(ColorConstant.themeColor)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
        
            Container(
              width: 40.w,
              height: 40.h,
              child: SvgPicture.asset(
                ImageConstant.zonkaDrawerLogo,
                fit: BoxFit.fill,
                width: 20.w,
                height: 40.h,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
