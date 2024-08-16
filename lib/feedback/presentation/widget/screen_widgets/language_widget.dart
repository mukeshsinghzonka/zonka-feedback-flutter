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
  final LanguageManagerController languageManagerController =
      Get.put(LanguageManagerController());
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  @override
  void initState() {
    languageManagerCall();
    super.initState();
  }

  Future<void> languageManagerCall() async {
    await languageManagerController.call();
    languageManagerController
        .filterLanguageSelected(widget.languagePage!.translations);
  }

  @override
  void dispose() {
    languageManagerController.filterlanguageModel.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          image: DecorationImage(
              onError: (exception, stackTrace) {},
              fit: BoxFit.cover,
              image: NetworkImage(
                  surveyFieldController.languageBackgroundPage.value)),
          color: HexColor(widget.languagePage?.pageBgColor ?? ""),
        ),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Image.network(
                surveyFieldController.surveyBgImageLogo.value,
                width: 50.w,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    widget
                            .languagePage!
                            .translations![
                                surveyFieldController.defaultTranslation.value]
                            ?.upperText ??
                        "",
                    style: TextStyle(fontSize: 24)),
              ),
            ),
        
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      surveyFieldController.defaultTranslation.value =
                          languageManagerController
                              .filterlanguageModel[index].languageCode;
                      surveyScreenManager
                          .setScreenTypeEnum(ScreenTypeEnumUtil.welcomScreen);
                    },
                    child: Center(
                      child: Container(
                        height: 40.h,
                        width: 70.w,
                        padding: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                          color: Colors.black,
                             border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        ),
                        child: Row(
                          children: [
                            Builder(builder: (context) {
                              if (widget.languagePage?.showFlagWithLanguage ==
                                  false) {
                                return Container();
                              }
                              return Image.asset(
                                languageManagerController
                                    .filterlanguageModel[index].imageUrlAsset,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container();
                                },
                              );
                            }),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${languageManagerController.filterlanguageModel[index].languageName}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: languageManagerController.filterlanguageModel.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 4,
                )),
        
            const SliverFillRemaining(
              hasScrollBody: false,
              child:
                  Align(alignment: Alignment.bottomCenter, child: ExitWidget()),
            )
        
          
          ],
        ));
  }
}
