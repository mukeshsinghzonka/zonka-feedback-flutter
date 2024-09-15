

import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/background_gallery_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/display_logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/filed_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/heading_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/intro_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/intro_page_translation.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_translation.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logo_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/option_gallery_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/option_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/option_translation.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/page_logo_gallery_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/customer_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/device_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_background_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_screen_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/thankyou_model.dart';
import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_location_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';


Future<void> registerHiveAdaptor() async {
     Hive.registerAdapter(LoginResponseAdapter());
     Hive.registerAdapter(LocationModelAdapter());
     Hive.registerAdapter(SurveySubmitModelAdapter());
     Hive.registerAdapter(SurveyResponseAdapter());
     Hive.registerAdapter(DeviceModelAdapter());
     Hive.registerAdapter(CustomerAdapter());
     Hive.registerAdapter(BackgroundGalleryImageIdAdapter());
     Hive.registerAdapter(ChoiceAdapter());
     Hive.registerAdapter(ChoiceTranslationAdapter());
     Hive.registerAdapter(DisplayLogicModelAdapter());
     Hive.registerAdapter(FieldAdapter());
     Hive.registerAdapter(FieldTranslationAdapter());
     Hive.registerAdapter(HeadingImageAdapter());
     Hive.registerAdapter(IntroPageAdapter());
     Hive.registerAdapter(IntroPageTranslationAdapter());
     Hive.registerAdapter(LanguageModelAdapter());
     Hive.registerAdapter(LanguagePageAdapter());
     Hive.registerAdapter(LanguagePageTranslationAdapter());
     Hive.registerAdapter(LogicAdapter());
     Hive.registerAdapter(LogoGalleryImageIdAdapter());
     Hive.registerAdapter(OptionAdapter());
     Hive.registerAdapter(OptionTranslationAdapter());
     Hive.registerAdapter(PageLogoGalleryImageIdAdapter());
     Hive.registerAdapter(SurveyBgGalleryImageIdAdapter());
     Hive.registerAdapter(SurveyModelAdapter());
     Hive.registerAdapter(SurveyScreenModelAdapter());
     Hive.registerAdapter(SurveyTranslationAdapter());
     Hive.registerAdapter(ThankyouPageAdapter());
     Hive.registerAdapter(SurveyResModelAdapter());
     Hive.registerAdapter(SurveyLocationModelAdapter());
     Hive.registerAdapter(OptionGalleryImageIdAdapter());

     
}