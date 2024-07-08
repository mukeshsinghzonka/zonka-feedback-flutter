
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/checkbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/csat_rating/csat_button_rating.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/date_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/emotion_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/nps_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/picture_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/radio_button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rank_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/scale_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/textbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/welcome_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


class ScreenFeedBackQuesController extends GetxController{



  Widget getScreenType(String type){
   return _switchWidget(screen: mapOfScreenByType(type));
  }

  SurveyScreenenum mapOfScreenByType(String type) {
  switch (type) {
    case 'mcqquestion':
      return SurveyScreenenum.buttonChoice;
    case 'radio':
      return SurveyScreenenum.radioChoice;
    case 'checkbox':
      return SurveyScreenenum.checkboxChoice;
    case 'pictureChoice':
      return SurveyScreenenum.pictureChoice;
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
      return SurveyScreenenum.welcomeWidget;
    case 'camera':
      return SurveyScreenenum.welcomeWidget;
    default:
      return SurveyScreenenum.buttonChoice;
  }
}



Widget  _switchWidget({required SurveyScreenenum screen}) {
  switch (screen) {
    case SurveyScreenenum.buttonChoice:
    return const ButtonChoiceWidget();
    case SurveyScreenenum.radioChoice:
    return const RadioButtonWidget();
    // case SurveyScreenenum.dropdownChoice:
    //   return const DropDownWidget();
    case SurveyScreenenum.checkboxChoice:
      return  const CheckboxWidget();
    case SurveyScreenenum.pictureChoice:
      return  const PictureChoiceWidget();
    case SurveyScreenenum.npsRating:
      return  const NpsWidget();
    case SurveyScreenenum.cesRating:
    case SurveyScreenenum.csatButtonRating:
      return  const CsatButtonRating();
    case SurveyScreenenum.scaleRating:
      return  const ScaleRatingWidget();
    case SurveyScreenenum.rankingRating:
      return  const RankRatingWidget();
    case SurveyScreenenum.starRating:
    case SurveyScreenenum.emotionRating:
      return  const EmotionRatingWidget();
    case SurveyScreenenum.textWidget:
      return  const TextboxWidget();
    case SurveyScreenenum.dateWidget:
      return  const DateWidget();
    case SurveyScreenenum.welcomeWidget:
      return  const WelcomeWidget();
    default:
      return  Container();
  }
}


}