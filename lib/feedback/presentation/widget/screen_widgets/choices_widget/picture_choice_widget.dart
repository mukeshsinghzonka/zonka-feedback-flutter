import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class PictureChoiceWidget extends StatefulWidget {
  final Field field;
  final bool isMultiple;
  const PictureChoiceWidget({super.key, required this.field, required this.isMultiple});

  @override
  State<PictureChoiceWidget> createState() => _PictureChoiceWidgetState();
}

class _PictureChoiceWidgetState extends State<PictureChoiceWidget>with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  static Map<String, bool> _choiceMap = {};
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  late ValidationLogicManager validationLogicManager;
  String optionId = "";
  int? range = -1;
  @override
  void initState() {
    super.initState();

    if (surveyCollectDataController.surveyIndexData
        .containsKey(widget.field.id)) {
      _choiceMap = surveyCollectDataController.surveyIndexData[widget.field.id]
          as Map<String, bool>;
    } else {
      for (int i = 0; i < widget.field.choices.length; i++) {
        _choiceMap[widget.field.choices[i].id ?? ""] = false;
      }
    }

    validationLogicManager = ValidationLogicManager(field: widget.field);
    range = validationLogicManager.getRangeValue(widget.isMultiple);
     _animationController.initAnimationController(this);
   
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      int trueCount = _choiceMap.values.where((value) => value == true).length;
      if (widget.field.required == true && trueCount == 0) {
        return validationLogicManager.requiredFormValidator(trueCount == 0);
      } else if (widget.field.specialSettingVal == 'range') {
        String? value = validationLogicManager.rangeValidator(trueCount);
        if (value == null) {
          surveyCollectDataController.updateSurveyData(
              quesId: widget.field.id ?? "", value: _choiceMap);
        }
        return value;
      } else if (widget.field.specialSettingVal == 'exact') {
        String? value = validationLogicManager.exactFormValidator(trueCount);
        if (value == null) {
          surveyCollectDataController.updateSurveyData(
              quesId: widget.field.id ?? "", value: _choiceMap);
        }
        return value;
      }
      surveyCollectDataController.updateSurveyData(
          quesId: widget.field.id ?? "", value: _choiceMap);
      return null;
    }, builder: (context) {
      return Container(
        margin: EdgeInsets.all(5.w),
        child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1.1,
            crossAxisSpacing: 10.w
          ),
          itemCount: widget.field.choices.length, // <-- required
          itemBuilder: (context, i) => GestureDetector(
            onTap: () async {
              if (widget.isMultiple) {
                int trueCount = _choiceMap.values.where((value) => value == true).length;
                if (range != -1 && trueCount == range && !_choiceMap[widget.field.choices[i].id]!) {
                  Fluttertoast.showToast(msg: 'You can select only $range options',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  _choiceMap.update(widget.field.choices[i].id ?? "", (value) => !value);
                    for(int i = 0 ;i<2;i++){
                       await _animationController.blinkingAnimation();         
                       setState(() {});
                    }
                  setState(() {});
                }
              } else {
                _choiceMap.updateAll((key, value) => false);
                _choiceMap.update(widget.field.choices[i].id ?? "", (value) => true);
                for(int i = 0 ;i<2;i++){
                    await _animationController.blinkingAnimation();         
                    setState(() {});
                }
                setState(() {});
              }
            },
            child: AnimatedBuilder(
              animation: _animationController.animation,
              builder: (context,child) {
                return Opacity(
                  opacity: _choiceMap[widget.field.choices[i].id] == true
                      ? _animationController.animation.value
                      : 1,
                  child: Center(
                    child: Container(
                      height: 200.h,
                      width: 150.w,
                      margin: const EdgeInsets.all(5),
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        border: Border.all(
                        color: HexColor(surveyFieldController.optionTextColor.value).withOpacity(1)),
                        color:HexColor(surveyFieldController.optionTextColor.value).withOpacity(_choiceMap[widget.field.choices[i].id] ??false ? 1 : 0.1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: CachedNetworkImage(
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                                child: CircularProgressIndicator(
                                                  value: progress.progress,
                                                ),
                                              ),
                                      errorWidget: (context, url, error) => Icon(
                                            Icons.image_not_supported,
                                            color: Colors.grey.shade700,
                                          ),
                                      imageUrl: widget.field.choices[i]
                                                  .optionGalleryImageId !=
                                              null
                                          ? surveyFieldController.createImageUrl(
                                              widget
                                                      .field
                                                      .choices[i]
                                                      .optionGalleryImageId
                                                      ?.companyId ??
                                                  "",
                                              widget.field.choices[i]
                                                      .optionGalleryImageId?.path ??
                                                  "")
                                          : ""),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '${widget.field.choices[i].translations[surveyFieldController.defaultTranslation.value]?.name}',
                            style: TextStyle(
                                fontSize: 4.sp,
                                color: _choiceMap[widget.field.choices[i].id] ??
                                        false
                                    ? Colors.white
                                    : HexColor(surveyFieldController
                                        .optionTextColor.value),
                                fontFamily:
                                    surveyFieldController.fontFamily.value),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ),
      );
    });
  }
}
