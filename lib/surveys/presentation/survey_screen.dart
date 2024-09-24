import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/services/shared_preference.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_manage_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_search_controller.dart';
import 'package:zonka_feedback/surveys/presentation/widget/survey_widget.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
   
  final SurveyManagerController _surveyManagerController = Get.put(SurveyManagerController());
  final SurveySearchController _surveySearchController = Get.put(SurveySearchController());
  final receivePort = ReceivePort();


  @override
  void initState() {
    super.initState();
    
    IsolateNameServer.registerPortWithName(receivePort.sendPort, 'mainThreadPort');
    // Listen for messages from the isolate indicating that Hive has been updated
    receivePort.listen((message) async {
      if (message == 'hive_updated') {
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

    @override
  void dispose() {
    // Unregister the port when the widget is disposed
    IsolateNameServer.removePortNameMapping('mainThreadPort');
    receivePort.close(); // Close the port to prevent memory leaks
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(ColorConstant.dashboardBackgroundColor),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                
              });
            },
            child: Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              alignment: Alignment.center,
              
              child: TextFormField(
                controller: _surveySearchController.searchSurveyController,
                onChanged: (value) {
                  _surveySearchController.filterSurveySearchList();
                
                },
                decoration: InputDecoration(
                  fillColor: const Color(ColorConstant.searchBarColor),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search by name or description',
                  hintStyle: const TextStyle( color: Colors.grey, fontSize: ConstantSize.small_2),
                  isDense: true,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ConstantSize.small_1),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ConstantSize.small_1),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GetBuilder(
            init: _surveyManagerController,
            builder: (context) {
              return SizedBox(
                height: size.height * 0.80,
                child: ListView.builder(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                    itemCount: _surveyManagerController.filteredSurveyList.length+1,
                    itemBuilder: (context, index) {
                      if(index == _surveyManagerController.filteredSurveyList.length){
                        return SizedBox(height: 120.h,);
                      }
                      return  SurveyWidget(
                        surveyResModel: _surveySearchController.filteredSurveySearchList.isEmpty?_surveyManagerController.filteredSurveyList[index]:_surveySearchController.filteredSurveySearchList[index],
                      );
                    }),
              );
            }
          ),
     
        ],
      ),
    );
  }
}
