import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class LocationWidget extends StatelessWidget {
  final LocationModel locationModel;
  LocationWidget({super.key, required this.locationModel});

  final _locationController = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: _locationController,
        builder: (context) {
          return Container(
            color: _locationController.selectedLocation != null &&
                      _locationController.selectedLocation == locationModel
                  ? const Color(ColorConstant.chooseLocationColor)
                  : Colors.white,
                  
            child: ListTile(
              trailing: _locationController.selectedLocation != null &&
                      _locationController.selectedLocation == locationModel
                  ? Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: const BoxDecoration(
                        color: Color(ColorConstant.themeColor),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        weight: 10,
                        size: 13.sp,
                      ))
                  : null,
              title: Text(
                '${locationModel.name} ',
                style: TextStyle(fontSize: ConstantSize.medium_1.sp),
              ),
              onTap: () async {
              await _locationController.setSelectedLocation(locationModel);
              },
            ),
          );
        });
  }
}
