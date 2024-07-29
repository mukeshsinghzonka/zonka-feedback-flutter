
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/choices_widget/drop_down_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/file_images_widget/image_capture_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/choices_widget/multiple_button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/choices_widget/checkbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/button_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/ces_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/circle_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/emotion_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/legal_signature_widget/legal_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/heart_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/nps_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/choices_widget/picture_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/choices_widget/radio_button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/rank_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/scale_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rating_scale_widget/star_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/text_input_widget/date_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/text_input_widget/textbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/thank_you_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/welcome_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


class ScreenFeedBackQuesController extends GetxController{

 

  Widget getScreenType(String type, Field field){   
   return _switchWidget(screen: mapOfScreenByType(type,field), field: field);
  }

  SurveyScreenenum mapOfScreenByType(String type,Field field) {
    print(type);
    switch (type) {
    case 'mcqquestion':
      return SurveyScreenenum.multipleButtonChoice;
    case 'msqquestion':
      return SurveyScreenenum.buttonChoice;
    case 'dropdown':
      return SurveyScreenenum.dropdownChoice;
    case 'radio':
      return  field.choicesHasImage??false ? SurveyScreenenum.pictureChoice : SurveyScreenenum.radioChoice;
    case 'checkbox':
      return  field.choicesHasImage??false ? SurveyScreenenum.multiplePictureChoice : SurveyScreenenum.checkboxChoice;
    case 'npsRating':
      return SurveyScreenenum.npsRating;
    case 'button_rating':
      return SurveyScreenenum.csatButtonRating;
    case 'scaleRating':
      return SurveyScreenenum.scaleRating;
    case 'RankingQuestion':
      return SurveyScreenenum.rankingRating;
    case 'star_rating':
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
    case 'npsquestion':
      return SurveyScreenenum.npsQuestion;
    case 'cssquestion':
      return SurveyScreenenum.cesquestion;
    case 'picture_rating':
      return SurveyScreenenum.pictureRating;
    case 'heart_rating':
      return SurveyScreenenum.heartRating;
    case 'circle_rating':
      return SurveyScreenenum.circleRating;
    default:
      return SurveyScreenenum.buttonChoice;
  }
}



Widget  _switchWidget({required SurveyScreenenum screen, required Field field}) {
  switch (screen) {
    case SurveyScreenenum.buttonChoice:
    return ButtonChoiceWidget(field: field,isMultiple: true,);
    case SurveyScreenenum.multipleButtonChoice:
    return ButtonChoiceWidget(field: field,isMultiple: false,);
    case SurveyScreenenum.radioChoice:
    return RadioButtonWidget(field: field);
    case SurveyScreenenum.dropdownChoice:
    return DropDownWidget(field: field,);
    case SurveyScreenenum.checkboxChoice:
    return CheckboxWidget(field: field , isMultiple: true,);
    case SurveyScreenenum.pictureChoice:
    return PictureChoiceWidget(field: field,isMultiple: false,);
    case SurveyScreenenum.multiplePictureChoice:
    return PictureChoiceWidget(field: field,isMultiple: true,);
    case SurveyScreenenum.npsRating:
    return NpsWidget(field: field,);
    case SurveyScreenenum.csatButtonRating:
    return ButtonRatingWidget(field: field,);
    case SurveyScreenenum.scaleRating:
    return ScaleRatingWidget(field: field,);
    case SurveyScreenenum.rankingRating:
    return RankRatingWidget(field: field,);
    case SurveyScreenenum.starRating:
    return StarRatingWidget(field: field,);
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
    case SurveyScreenenum.cameraWidget:
    return ImageCaptureWidget(field:field,);
    case SurveyScreenenum.npsQuestion:
    return NpsWidget(field: field,);
    case SurveyScreenenum.cesquestion:
    return CesWidget(field: field,);
    case SurveyScreenenum.pictureRating:
    return PictureChoiceWidget(field: field,isMultiple: false,);
    case SurveyScreenenum.heartRating:
    return HeartRatingWidget(field: field,);
    case SurveyScreenenum.circleRating:
    return CircleRatingWidget(field: field,);
    default: return Container();
  }
}

}