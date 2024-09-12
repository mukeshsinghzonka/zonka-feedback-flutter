import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/location/presentation/manager/search_location_controller.dart';
import 'package:zonka_feedback/location/presentation/screen/widget/location_widget.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class ChooseDefaultLocation extends StatefulWidget {
  const ChooseDefaultLocation({super.key});

  @override
  State<ChooseDefaultLocation> createState() => _ChooseDefaultLocationState();
}

class _ChooseDefaultLocationState extends State<ChooseDefaultLocation> {
  final _locationController = Get.put(LocationController());
  final _locationSearchController = Get.put(SearchLocationController());

  @override
  void initState() {
    _locationController.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: GetBuilder(
              init: _locationController,
              builder: (context) {
              final  filterLocationList =  _locationSearchController.filteredLocationList;
                return Container(
                  color: const Color(ColorConstant.chooseLocationColor),
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w, top: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose Default Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: ConstantSize.large_3.sp),
                            ),
                            SizedBox(
                                width: 250.w,
                                child: Text(
                                    'This will a default location for all your surveys.',
                                    style: TextStyle(
                                        fontSize: ConstantSize.medium_1.sp))),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 40.w, left: 20.w, right: 20.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.w, horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _locationSearchController
                                  .searchLocationController,
                              onChanged: (String value) {
                                Future.delayed(const Duration(seconds: 2), () {
                                  _locationSearchController.filterLocationList(
                                      _locationSearchController
                                          .searchLocationController.text);
                           if(mounted) setState(() {});
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Search Location',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.normal,
                                    fontSize: ConstantSize.small_2.sp),
                                isDense: true,
                                contentPadding: EdgeInsets.all(10.sp),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                                height: 300.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: ListView.builder(
                                  itemCount: filterLocationList.isNotEmpty
                                      ? filterLocationList.length
                                      : _locationController.locationList.length,
                                  itemBuilder: (context, index) {
                                    return LocationWidget(
                                      locationModel: filterLocationList.isNotEmpty
                                          ? filterLocationList[index]
                                          : _locationController
                                              .locationList[index],
                                    );
                                  },
                                ))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                        await HiveService().putData(HiveDirectoryUtil.locationBox, HiveKey.skipLocationKey, true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width,
                          margin: EdgeInsets.only(top: 100.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Skip',
                                style: TextStyle(
                                    color: Color(ColorConstant.themeColor)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset(ImageConstant.arrowForward)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
