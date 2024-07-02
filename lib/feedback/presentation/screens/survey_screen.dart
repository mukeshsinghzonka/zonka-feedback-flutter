import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/presentation/widget/button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/checkbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/csat_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/drop_down_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/nps_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/picture_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/radio_button_choice_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              Container(
                  height: size.height / 1.4,
                  width: size.width / 1.1,
              
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const  Text('Picture Choice'),
                      SizedBox(height: 5.h,),
                      Builder(
                        builder: (context) {
                          return Container(
                                 height: 140.h,
                                  width: 250.w,
                              alignment: Alignment.topCenter,
                             child: _switchWidget(screen: SurveyScreenenum.npsRating),);
                        }
                      )
                    ],
                  )
                  ),
                  SizedBox(height: 20.h,),
                 const Text('Powered By Zonka FeedBack')
              
            ],
          ),
        ),
      ),
    );
  }
}

Widget _switchWidget({required SurveyScreenenum screen}) {
  switch (screen) {
    case SurveyScreenenum.buttonChoice:
      return const ButtonChoiceWidget();
    case SurveyScreenenum.radioChoice:
    return const RadioButtonWidget();
    case SurveyScreenenum.dropdownChoice:
     return const DropDownWidget();
    case SurveyScreenenum.checkboxChoice:
      return const CheckboxWidget();
    // TODO: Handle this case.
    case SurveyScreenenum.pictureChoice:
      return const PictureChoiceWidget();
    // TODO: Handle this case.
    case SurveyScreenenum.npsRating:
      return NpsWidget();
    // TODO: Handle this case.
    case SurveyScreenenum.cesRating:
    // TODO: Handle this case.
    case SurveyScreenenum.csatRating:
      return const CsatWidget();
    // TODO: Handle this case.
    case SurveyScreenenum.scaleRating:
    // TODO: Handle this case.
    case SurveyScreenenum.rankingRating:
    // TODO: Handle this case.
    case SurveyScreenenum.starRating:
    // TODO: Handle this case.
    default:
      return Container();
  }
}
