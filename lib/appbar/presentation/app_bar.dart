import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/dashboard/widget/warning_widget.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  AppBar(
          elevation: 3,
          // bottom: const PreferredSize(
          //   preferredSize: Size.fromHeight(1000),
          //   child: WarningWidget()),
          leading: Builder(
            builder : (context) => IconButton(
              icon: SvgPicture.asset(
                ImageConstant.drawerIcon,
                width: 20.w,
                height: 20.h,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Workspaces',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
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
              ),
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
          backgroundColor: const Color(ColorConstant.themeColor));
  }
  
  @override
  Size get preferredSize =>  Size.fromHeight(50.h);
}