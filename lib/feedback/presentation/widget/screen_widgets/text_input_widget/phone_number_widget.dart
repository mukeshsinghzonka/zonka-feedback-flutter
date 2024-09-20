import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class PhoneNumberWidget extends StatefulWidget {
  final Field field;
  const PhoneNumberWidget({super.key, required this.field});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  final SurveyDesignFieldController _surveyDesignFieldController =
      Get.find<SurveyDesignFieldController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width / 5),
      child: Row(
        children: [
          Container(
            height: size.height / 15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  HexColor(_surveyDesignFieldController.optionTextColor.value)
                      .withOpacity(0.1),
              border: Border.all(
                color: HexColor(
                    _surveyDesignFieldController.optionTextColor.value),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CountryCodePicker(
              padding: const EdgeInsets.all(0),
              backgroundColor:
                  HexColor(_surveyDesignFieldController.optionTextColor.value)
                      .withOpacity(0.1),
              onChanged: (element) => {
                print("countrycodelement ${element.dialCode}")
              },
              initialSelection: 'TF',
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
            child:TextFormField(
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
