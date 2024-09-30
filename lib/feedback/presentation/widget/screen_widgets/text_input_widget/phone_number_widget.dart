import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class PhoneNumberWidget extends StatefulWidget {
  final Field field;
  const PhoneNumberWidget({super.key, required this.field});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  final SurveyDesignFieldController _surveyDesignFieldController = Get.find<SurveyDesignFieldController>();
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  final TextEditingController _phoneNumberController = TextEditingController();
  String phoneNumber ="";
  String dialCode = "+91";

 @override
  void initState() {
   validationLogicManager = ValidationLogicManager(field: widget.field);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width / 5),
      height: size.height/20,
      child: Row(
        children: [
          Container(
            height: size.height / 10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:HexColor(_surveyDesignFieldController.optionTextColor.value).withOpacity(0.1),
              border: Border.all(
                color: HexColor(_surveyDesignFieldController.optionTextColor.value),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CountryCodePicker(
               
              padding: const EdgeInsets.all(0),
              backgroundColor:HexColor(_surveyDesignFieldController.optionTextColor.value).withOpacity(0.1),
              onChanged: (element) => {
                // phoneNumber =  "${element.dialCode}"
                dialCode = element.dialCode??"+91"
              },
              initialSelection: 'IN',
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              showFlag: false,
              favorite: const ['+39', 'FR'],
            ),
          ),
          SizedBox(
            width: size.width / 100,
          ),
          Expanded(
            child: TextFormField(
              controller: _phoneNumberController,
                 validator: (value) {

                  String? valid = validationLogicManager.inputTextValidation(value);
            
                  if(valid!=null){
                    return valid;
                  }
            
                  if (valid == null) {

                    surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: phoneNumber);
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.transparent),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: HexColor(
                            _surveyDesignFieldController.optionTextColor.value),
                        width: 1.0),
                  ),
                  hintText: widget
                          .field
                          .translations![_surveyDesignFieldController
                              .defaultTranslation.value]
                          ?.placeHolder ??
                      '',
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(_surveyDesignFieldController
                              .optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(_surveyDesignFieldController
                              .optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  filled: true,
                  fillColor: HexColor(
                          _surveyDesignFieldController.optionTextColor.value)
                      .withOpacity(0.1),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 10.0),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(_surveyDesignFieldController
                              .optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(_surveyDesignFieldController
                              .optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
          )
        ],
      ),
    );
  }
}
