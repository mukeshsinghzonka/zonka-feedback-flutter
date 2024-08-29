import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/language_api_manager.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/template_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class LanguageWidget extends StatefulWidget {
  final LanguagePage? languagePage;
  const LanguageWidget({super.key, required this.languagePage});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final LanguageManagerController languageManagerController =
      Get.put(LanguageManagerController());
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
 final  ScrollController _scrollController = new ScrollController();
  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset -
          MediaQuery.of(context).size.width /
              1.2, // Adjust the offset as needed
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset +
          MediaQuery.of(context).size.width /
              1.2, // Adjust the offset as needed
      duration:const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              onError: (exception, stackTrace) {},
              fit: BoxFit.cover,
              image: NetworkImage(
                  surveyFieldController.languageBackgroundPage.value)),
          color: HexColor(widget.languagePage?.pageBgColor ?? ""),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              surveyFieldController.surveyBgImageLogo.value,
              width: 100.w,
              height: 50.h,
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
            Expanded(
              flex: 15,
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          widget
                                  .languagePage!
                                  .translations![surveyFieldController
                                      .defaultTranslation.value]
                                  ?.upperText ??
                              "",
                          style: TextStyle(fontSize: 8.sp)),
                    ),
                    Container(
                      height: size.height / 2,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                scrollLeft();
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          Expanded(
                            child: Padding(
                            
                              padding:  EdgeInsets.symmetric(horizontal:21.w),
                              child: ListView.builder(
                                controller: _scrollController,
                                
                                scrollDirection: Axis.horizontal,
                                itemCount: (languageManagerController
                                            .filterlanguageModel.length /
                                        9)
                                    .ceil(),
                                itemBuilder: (context, index) {
                                  // Calculate start and end index for the current grid
                                  int startIndex = index * 9;
                                  int endIndex = startIndex + 9;
                                  if (endIndex > languageManagerController.filterlanguageModel.length) {
                                    endIndex = languageManagerController.filterlanguageModel.length;
                                  }
                              
                                  return Container(
                                    width: 295.w,
                                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                                    child: GridView.builder(
                                      gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount( 
                                          crossAxisCount:
                                            3, // 3 columns in each row
                                        childAspectRatio:
                                            6, // Adjust as needed
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 5.0,
                                      ),
                                      itemCount: endIndex - startIndex,
                                      physics: const NeverScrollableScrollPhysics(), // Prevent inner grid from scrolling
                                      shrinkWrap: true, // Ensures GridView takes only the space it needs
                                      itemBuilder: (context, gridIndex) {
                                        int itemIndex = startIndex + gridIndex;
                                        return GestureDetector(
                                          onTap: () {
                                            surveyFieldController
                                                    .defaultTranslation
                                                    .value =
                                                languageManagerController
                                                    .filterlanguageModel[
                                                        itemIndex]
                                                    .languageCode;
                                            surveyScreenManager
                                                .setScreenTypeEnum(
                                                    ScreenTypeEnumUtil
                                                        .welcomScreen);
                                          },
                                          child: Center(
                                            child: Container(
                                            width: 100.w,
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                border: Border.all(color: Colors.blueAccent),
                                                borderRadius: BorderRadius.all(
                                                        Radius.circular(
                                                            10.r)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (widget
                                                              .languagePage
                                                              ?.showFlagWithLanguage ==
                                                          false) {
                                                        return Container();
                                                      }
                                                      return Image.asset(
                                                        languageManagerController
                                                            .filterlanguageModel[
                                                                itemIndex]
                                                            .imageUrlAsset,
                                                        errorBuilder:
                                                            (context, error,
                                                                stackTrace) {
                                                          return Container();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        languageManagerController
                                                            .filterlanguageModel[
                                                                itemIndex]
                                                            .languageName,
                                                        style:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                scrollRight();
                              },
                              child:const Icon(Icons.arrow_forward_ios_sharp)),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
            Obx(
               () {
                if(surveyFieldController.screenBotton.value == SuveryScreenBottom.templateBottomBar){
                  return const TemplateBottomFeedback();
                }
                return const ExitWidget();
              }
            )
          ],
        ));
  }
}
