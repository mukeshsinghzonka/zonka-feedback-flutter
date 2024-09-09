import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/setting/manager/country_code_controller.dart';
import 'package:zonka_feedback/setting/presentation/widget/search_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool showSearchLocation = false;
  bool countryCodeDrop = false;
  final locationController = Get.find<LocationController>();
  final countryCodeController = Get.put(CountryCodeController());
  @override
  void initState() {
    locationController.call();
    countryCodeController.call();
    locationController.setSelectedLocationFromHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.w, horizontal: 5.w),
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${locationController.selectedLocation?.name}'),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey.shade400,
                                  )
                                ],
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
                            showSearchLocation: showSearchLocation,
                            callback: (val) {
                              locationController.setSelectedLocation(
                                  locationController.locationList
                                      .firstWhere((e) {
                                return e.id == val.id;
                              }));
                            },
                            searchListData: List.from(
                                locationController.locationList.map((e) {
                              return SearchListClass(
                                  listName: e.name,
                                  isSelected:
                                      locationController.selectedLocation?.id ==
                                          e.id,
                                  id: e.id,
                              
                                  showImage: false);
                            })),
                          );
                        })
                  ],
                )),
            SizedBox(
              height: size.height / 30,
            ),

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
                    const Text('Default Country Code'),
                    SizedBox(
                      height: 5.h,
                    ),
                    GetBuilder(
                        init: countryCodeController,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                countryCodeDrop = !countryCodeDrop;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.w, horizontal: 5.w),
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  border:
                                      Border.all(color: Colors.grey.shade200)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${countryCodeController.countryCodeModel.value.countryName}'),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey.shade400,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    GetBuilder(
                        init: countryCodeController,
                        builder: (context) {
                          return SearchCommonWidget(
                            showSearchLocation: countryCodeDrop,
                            callback: (val) {
                             countryCodeController.setCountryCodeModel(
                              countryCodeController.countryCodeList.value.firstWhere((e){
                                return e.code == val.id;
                              })
                             );
                      
                            },
                            searchListData: List.from(countryCodeController.countryCodeList.value.map((e) {
                              return SearchListClass(
                                  listName: e.countryName,
                                  isSelected: e.code == countryCodeController.countryCodeModel.value.code,

                                  id: e.code,
                                  showImage: false);
                            })),
                          );
                        })
                  ],
                )),

                SizedBox(
                  height: 80.h,
                )
          ],
        ),
      ),
    );
  }
}
