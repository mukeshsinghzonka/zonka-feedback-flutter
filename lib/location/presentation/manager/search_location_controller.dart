import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';

class SearchLocationController extends GetxController {
  final LocationController _locationController = Get.find<LocationController>();
  final TextEditingController _searchLocationController = TextEditingController();
  TextEditingController get searchLocationController => _searchLocationController;

   List<LocationModel> _filteredLocationList = [];
   List<LocationModel> get filteredLocationList => _filteredLocationList;
   void setFilteredLocationList(List<LocationModel> ?locationList) {
       _filteredLocationList = locationList ?? [];
       update();
    }


  void filterLocationList(String? searchText) {
    if (searchText == null || searchText.isEmpty) {
      filteredLocationList.clear();
      return;
    }
    setFilteredLocationList(_locationController.locationList
        .where((element) =>
            element.name.replaceAll(' ', '').replaceAll(',', '').toLowerCase().contains(searchText.toLowerCase()))
        .toList());
  }
}