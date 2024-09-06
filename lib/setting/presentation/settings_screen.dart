import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/setting/presentation/widget/search_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool showSearchLocation = false;
  final locationController = Get.find<LocationController>();

  @override
  void initState() {
    // TODO: implement initState
    locationController.call();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5.w),
      child: Column(
        children: [
          Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Default Location'),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showSearchLocation = !showSearchLocation;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 5.w),
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Select Country'),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey.shade400,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GetBuilder(
                    init: locationController,
                    builder: (context) {
                      return SearchCommonWidget(
                        showSearchLocation: showSearchLocation,
                        searchListData: List.from(locationController.locationList.map((e){
                          return SearchListClass(
                            listName: e.name,
                            isSelected: false,
                            id: e.id,
                            showImage: false
                          ); 
                        })),
                      );
                    }
                  )
                ],
              )),
        ],
      ),
    );
  }
}
