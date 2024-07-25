
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/multiple_button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/checkbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/csat_rating/csat_button_rating.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/date_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/drop_down_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/emotion_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/legal_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/nps_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/picture_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/radio_button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rank_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/scale_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/textbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/thank_you_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/welcome_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


class ScreenFeedBackQuesController extends GetxController{

 

  Widget getScreenType(String type, Field field){   
   return _switchWidget(screen: mapOfScreenByType(type,field), field: field);
  }

  SurveyScreenenum mapOfScreenByType(String type,Field field) {
    print("screentype $type");
  switch (type) {
    case 'mcqquestion':
      return SurveyScreenenum.buttonChoice;
      case 'msqquestion':
      return SurveyScreenenum.buttonChoice;
    case 'dropdown':
      return SurveyScreenenum.dropdownChoice;
    case 'radio':
      return  field.choicesHasImage??false ? SurveyScreenenum.pictureChoice : SurveyScreenenum.radioChoice;
    case 'checkbox':
      return  field.choicesHasImage??false ? SurveyScreenenum.pictureChoice : SurveyScreenenum.checkboxChoice;
    case 'npsRating':
      return SurveyScreenenum.npsRating;
    case 'csatButtonRating':
      return SurveyScreenenum.csatButtonRating;
    case 'scaleRating':
      return SurveyScreenenum.scaleRating;
    case 'RankingQuestion':
      return SurveyScreenenum.rankingRating;
    case 'starRating':
      return SurveyScreenenum.starRating;
    case 'emotion_rating':
      return SurveyScreenenum.emotionRating;
    case 'text_box':
      return SurveyScreenenum.textWidget;
    case 'date':
      return SurveyScreenenum.dateWidget;
    case 'welcomeWidget':
      return SurveyScreenenum.welcomeWidget;
    case 'legalTerm':
      return SurveyScreenenum.legalTerm;
    case 'camera':
      return SurveyScreenenum.cameraWidget;
    case 'thankYouWidget':
      return SurveyScreenenum.thankYouWidget;
    default:
      return SurveyScreenenum.buttonChoice;
  }
}



Widget  _switchWidget({required SurveyScreenenum screen, required Field field}) {
  switch (screen) {
    case SurveyScreenenum.buttonChoice:
    return ButtonChoiceWidget(field: field,);
    case SurveyScreenenum.radioChoice:
    return RadioButtonWidget(field: field,);
    case SurveyScreenenum.dropdownChoice:
    return DropDownWidget(field: field,);
    case SurveyScreenenum.checkboxChoice:
    return CheckboxWidget(field: field,);
    case SurveyScreenenum.pictureChoice:
    return PictureChoiceWidget(field: field,);
    case SurveyScreenenum.npsRating:
    return NpsWidget(field: field,);
    case SurveyScreenenum.cesRating:
    case SurveyScreenenum.csatButtonRating:
    return CsatButtonRating(field: field,);
    case SurveyScreenenum.scaleRating:
    return ScaleRatingWidget(field: field,);
    case SurveyScreenenum.rankingRating:
    return RankRatingWidget(field: field,);
    case SurveyScreenenum.starRating:
    case SurveyScreenenum.emotionRating:
    return EmotionRatingWidget(field: field,);
    case SurveyScreenenum.textWidget:
    return TextboxWidget(field: field,);
    case SurveyScreenenum.dateWidget:
    return DateWidget(field: field,);
    case SurveyScreenenum.welcomeWidget:
    return WelcomeWidget(field: field,);
    case SurveyScreenenum.thankYouWidget:
    return ThankYouWidget(field: field,);
    case SurveyScreenenum.legalTerm:
    return LegalWidget(field:field,);
    default: return  Container();
  }
}


}