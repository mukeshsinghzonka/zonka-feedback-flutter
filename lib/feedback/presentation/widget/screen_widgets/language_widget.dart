import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/language_api_manager.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class LanguageWidget extends StatefulWidget {
  final LanguagePage? languagePage;
  const LanguageWidget({super.key, required this.languagePage});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  LanguageManagerController languageManagerController =
      Get.put(LanguageManagerController());
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  @override
  void initState() {
    languageManagerCall();
    super.initState();
  }

  Future<void> languageManagerCall() async {
    await languageManagerController.call();
    languageManagerController.filterLanguageSelected(widget.languagePage!.translations);
  }

 @override
  void dispose() {
    languageManagerController.filterlanguageModel.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            onError: (exception, stackTrace) {},
            fit: BoxFit.cover,
            image: NetworkImage(surveyFieldController.surveyBgImage.value)),
        color: HexColor(surveyFieldController.surveyBgColor.value),
      ),
      child:  Column(
          children: [
            SingleChildScrollView(
              child: Container(
                     margin: EdgeInsets.all(100.h),
                           alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.languagePage!.translations![surveyFieldController.defaultTranslation.value]?.upperText ??"",
                      style: TextStyle(fontSize: 20.h),
                    ),
                    SizedBox(height: 20.h,),
                    Obx(() {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: languageManagerController.filterlanguageModel.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 5,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                surveyFieldController.defaultTranslation.value = languageManagerController.filterlanguageModel[index].languageCode;
                                 surveyScreenManager.setScreenTypeEnum(ScreenTypeEnumUtil.welcomScreen);
                              },
                              child: Center(
                                child: Container(
                                  height: 40.h,
                                  width: 70.w,
                                  padding: EdgeInsets.all(1.w),
                                  decoration: BoxDecoration(
                                     color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r)
                                      ),   
                                     ),
                                  child: Row(
                                               
                                    children: [
                                      Image.asset(languageManagerController.filterlanguageModel[index].imageUrlAsset,
                                      errorBuilder: (context, error, stackTrace) {
                                      return Container();
                                      },
                                      ),        
                                      Expanded(
                                      
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("${languageManagerController.filterlanguageModel[index].languageName }",
                                          style: const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                
                   
                  ],
                ),
                
              ),

            ),
             Expanded(
              child: Container(
               margin: EdgeInsets.all(5.h),
              child:const ExitWidget()))
          ],
        )
      
    );
  }
}
