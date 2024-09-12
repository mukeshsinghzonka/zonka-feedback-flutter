import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/setting/presentation/widget/search_widget.dart';

class LocationWidgetSetting extends StatefulWidget {
  const LocationWidgetSetting({super.key});

  @override
  State<LocationWidgetSetting> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidgetSetting> {
  bool showSearchLocation = false;
  final locationController = Get.find<LocationController>();

  @override
  void initState() {
    locationController.call();
    locationController.setSelectedLocationFromHive();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
            GetBuilder(
                init: locationController,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        showSearchLocation = !showSearchLocation;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.w, horizontal: 5.w),
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Builder(
                        builder: (context) {
                          if(locationController.selectedLocation == null){
                              return  Text('Select Location',style: TextStyle(color: Colors.grey.shade700, fontFamily: 'Source Sans Pro',),);
                              
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${locationController.selectedLocation?.name}'),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.shade400,
                              )
                            ],
                          );
                        }
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 10.h,
            ),
            GetBuilder(
                init: locationController,
                builder: (context) {
                  return SearchCommonWidget(
                    searchHintText: 'Search Location',
                    showSearchLocation: showSearchLocation,
                    callback: (val) {
                      locationController.setSelectedLocation(
                          locationController.locationList.firstWhere((e) {
                        return e.id == val.id;
                      }));
                    },
                    searchListData:
                        List.from(locationController.locationList.map((e) {
                      return SearchListClass(
                          listName: e.name,
                          isSelected:
                              locationController.selectedLocation?.id == e.id,
                          id: e.id,
                          showImage: false);
                    })),
                  );
                })
          ],
        ));
  }
}
