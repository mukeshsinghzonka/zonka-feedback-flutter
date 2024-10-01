import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/hexcolor_util.dart';
import '../../../../data/data_model_new/field_model.dart';
import '../../../../data/data_model_new/server_name.dart';
import '../../../manager/animation/blinking_animation_controller.dart';
import '../../../manager/survery_api_feedback_controller.dart';
import '../../../manager/survey_collect_data_controller.dart';
import '../../../manager/survey_design_controller.dart';
import '../../../manager/survey_next_screen_controller.dart';
import '../../../manager/validation_logic_manager.dart';

class DropDownServerNameWidget extends StatefulWidget {
  final Field field;
  const DropDownServerNameWidget({super.key,  required this.field , });

  @override
  State<DropDownServerNameWidget> createState() => _DropDownServerNameWidgetState();
}

class _DropDownServerNameWidgetState extends State<DropDownServerNameWidget> with SingleTickerProviderStateMixin {
  final BlinkingAnimmationController _animationController =  BlinkingAnimmationController();
  final SurveyDesignFieldController surveyFieldController =  Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  ServerNameModel ? serverNameModel = null;
  late ValidationLogicManager validationLogicManager;
  final SurveryApiFeedbackController surveryFeedbackApiController = Get.find<SurveryApiFeedbackController>();
@override
  void initState() {
  validationLogicManager = ValidationLogicManager(field: widget.field);
  _animationController.initAnimationController(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _animationController.animation,
        builder: (context, child) {
          return Opacity(
            opacity: _animationController.animation.value,
            child: DropdownButtonFormField(
                value: serverNameModel,
                hint: const Text('Select'),
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                isDense: true,
                style: TextStyle(
                  color: HexColor(surveyFieldController.optionTextColor.value),
                ),
                validator: (value) {
                  if (widget.field.required == true && serverNameModel == null) {
                    return validationLogicManager.requiredFormValidator(serverNameModel == null);
                  }
                  surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: serverNameModel);
                  return null;
                },

                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxWidth: size.width / 2,
                    maxHeight: size.height/8
                  ),
                  filled: true,
                  fillColor: HexColor(surveyFieldController.optionTextColor.value).withAlpha(50),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: HexColor(surveyFieldController.optionTextColor.value),// Set the color of the border
                      width: 1,        // Set the width of the border
                    ),
                  ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Optional: For rounded borders
                    borderSide: BorderSide(
                      color: HexColor(surveyFieldController.optionTextColor.value),// Set the color of the border
                      width: 1,        // Set the width of the border
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                ),
                dropdownColor:  Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.r),
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.all(0),
                items: surveryFeedbackApiController.surveyDataModel.value.serveNameModel!.map<DropdownMenuItem<ServerNameModel>>((ServerNameModel value) {
                  return DropdownMenuItem<ServerNameModel>(
                    value: value,
                    child:  Text(
                      value.serverName ??"",
                      style:const  TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) async {
                  serverNameModel = value;
                  for (int i = 0; i < 2; i++) {
                    await _animationController.blinkingAnimation();
                    setState(() {});
                  }
                  Future.delayed(const Duration(milliseconds: 300), () {
                    surveyScreenManager.nextScreen();
                  });
                }),
          );
        });
  }
}
