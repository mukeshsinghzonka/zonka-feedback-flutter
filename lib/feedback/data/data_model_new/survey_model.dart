import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/intro_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logo_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_background_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_screen_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/thankyou_model.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'survey_model.g.dart';

@HiveType(typeId: HiveTypeId.surveyModelId)
class SurveyModel extends HiveObject{
  SurveyModel({
    required this.newVersion,
    // required this.locationTags,
    // required this.locations,
    // required this.distributionChannels,

    required this.description,
    required this.createdUsingAi,
    required this.isAiAssisted,
    required this.isUsedInTemplate,
    required this.webSurveyTitle,
    required this.webViewMode,
    required this.logoGalleryImageId,
    required this.hideLogoInDevice,
    required this.theme,
    required this.viewMode,
    required this.mode,
    required this.isMobileSurvey,
    required this.showIntroPage,
    required this.showThankyouPage,
    required this.showStaffScreenInAssistedMode,
    required this.staffScreenPosition,
    required this.scale,
    required this.minPercentage,
    required this.maxPercentage,
    required this.thankyouScreenTimeOut,
    required this.showInactiveAlert,
    required this.appInactiveTimeout,
    required this.showExitButtonOnIntro,
    required this.showExitButtonOnThankyou,
    required this.allowGestureToExit,
    required this.exitPassword,
    required this.exitPin,
    required this.googleAnalyticsTrackingId,
    required this.isEmailTrackingEnabled,
    required this.isSmsTrackingEnabled,
    required this.redirectUrlFromWebSurvey,
    required this.redirectWebSurveyIn,
    required this.showSkipButtonInsteadOfNext,
    required this.hideDoneButtonInClickThrough,
    required this.switchLanguageScreenDisplay,
    required this.switchLanguageButtonDisplay,
    required this.languagePickView,
    required this.hidePrevNextButton,
    required this.checkEmailForRepeatGuest,
    required this.checkMobileForRepeatGuest,
    required this.checkUniqueIdForRepeatGuest,
    required this.allowNewResponseAlert,
    required this.allowLowRatingResponseAlert,
    required this.allowThanksToGuestEmailAlert,
    required this.allowThanksGuestSmsAlert,
    required this.allowLowRateGuestSmsAlert,
    required this.tabletResponses,
    required this.mobileResponses,
    required this.webResponses,
    required this.isTemplate,
    required this.isClickThroughSurvey,
    required this.isPasswordRequiredForExitSurvey,
    required this.isPwdReqForGestureExit,
    required this.isWebSurveyPublished,
    required this.otpValidation,
    required this.isTemplateOptionUsed,
    required this.themeApplied,
    required this.surveyBgColor,
    required this.applySurveyBackgroundImage,
    required this.surveyBgGalleryImageId,
    required this.fontFamily,
    required this.fontSize,
    required this.applyCustomFontSize,
    required this.labelCustomFontSize,
    required this.optionCustomFontSize,
    required this.fontColorLabel,
    required this.fontColorValue,
    required this.fontColorSelectedBtn,
    required this.applyTopStripColor,
    required this.topStripColor,
    required this.applyTopStripAlpha,
    required this.previousNextArrowColor,
    required this.previousNextTextColor,
    required this.previousNextPosition,
    required this.paginationStyle,
    required this.showNumberInPaging,
    required this.isIconIntialStateBright,
    required this.buttonColor,
    required this.buttonSelectedColor,
    required this.buttonFontColor,
    required this.buttonSelectedFontColor,
    required this.navigationButtonPosition,
    required this.doneButtonPosition,
    required this.doneButtonColor,
    required this.doneButtonTextColor,
    required this.defaultLanguageCode,
    required this.defaultCommentField,
    required this.translations,
    required this.introPage,
    required this.thankyouPage,
    required this.languagePage,
    required this.sequenceOrder,
    required this.widgetSequenceOrder,
    required this.surveyScreens,
    // required this.staffScreen,
    required this.hideInDevice,
    required this.isActive,
    required this.isDeleted,
    required this.isSuspicious,
    required this.isTrusted,
    required this.pinned,
    required this.type,
    required this.showPollResults,
    required this.showQuizScore,
    required this.showQuizAnswers,
    required this.useCheckedAnswersForScoreCal,
    required this.showLeaderboard,
    required this.quizTotalTime,
    required this.quizQuestionFixedTime,
    required this.quizTimeType,
    required this.isQuizTimed,
    required this.updateCacheSurvey,
    required this.showAsteriskInRequiredField,
    required this.allowPartialSubmission,
    required this.screenJumpAnimation,
    required this.choiceMarkingAnimation,
    required this.thankyouOptionTopText,
    required this.thankyouOptionBottomText,
    required this.lastModifierIpAddress,
    required this.lastModifierUserAgent,
    required this.lastModifierAction,
    required this.id,
    required this.name,
    required this.shortCode,
    required this.createdDate,
    required this.modifiedDate,
    required this.builderLastModifiedDate,
    required this.preMongifiedId,
    required this.companyId,
    required this.createdBy,
    required this.modifiedBy,
    required this.s3GalleryImageUrl,
  });

  // final List<dynamic> locationTags;
  // final List<dynamic> locations;
  // final List<dynamic> distributionChannels;
  @HiveField(0)
  final bool? newVersion;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final bool? createdUsingAi;

  @HiveField(3)
  final bool? isAiAssisted;

  @HiveField(4)
  final bool? isUsedInTemplate;

  @HiveField(5)
  final String? webSurveyTitle;

  @HiveField(6)
  final String? webViewMode;

  @HiveField(7)
  final LogoGalleryImageId? logoGalleryImageId;

  @HiveField(8)
  final bool? hideLogoInDevice;

  @HiveField(9)
  final String? theme;

  @HiveField(10)
  final String? viewMode;

  @HiveField(11)
  final String? mode;

  @HiveField(12)
  final bool? isMobileSurvey;

  @HiveField(13)
  final bool? showIntroPage;

  @HiveField(14)
  final bool? showThankyouPage;

  @HiveField(15)
  final bool? showStaffScreenInAssistedMode;

  @HiveField(16)
  final String? staffScreenPosition;

  @HiveField(17)
  final int? scale;

  @HiveField(18)
  final int? minPercentage;

  @HiveField(19)
  final int? maxPercentage;

  @HiveField(20)
  final int? thankyouScreenTimeOut;

  @HiveField(21)
  final bool? showInactiveAlert;

  @HiveField(22)
  final int? appInactiveTimeout;

  @HiveField(23)
  final bool? showExitButtonOnIntro;

  @HiveField(24)
  final bool? showExitButtonOnThankyou;

  @HiveField(25)
  final bool? allowGestureToExit;

  @HiveField(26)
  final String? exitPassword;

  @HiveField(27)
  final String? exitPin;

  @HiveField(28)
  final String? googleAnalyticsTrackingId;

  @HiveField(29)
  final bool? isEmailTrackingEnabled;

  @HiveField(30)
  final bool? isSmsTrackingEnabled;

  @HiveField(31)
  final String? redirectUrlFromWebSurvey;

  @HiveField(32)
  final int? redirectWebSurveyIn;

  @HiveField(33)
  final bool? showSkipButtonInsteadOfNext;

  @HiveField(34)
  final bool? hideDoneButtonInClickThrough;

  @HiveField(35)
  final String? switchLanguageScreenDisplay;

  @HiveField(36)
  final String? switchLanguageButtonDisplay;

  @HiveField(37)
  final String? languagePickView;

  @HiveField(38)
  final String? hidePrevNextButton;

  @HiveField(39)
  final bool? checkEmailForRepeatGuest;

  @HiveField(40)
  final bool? checkMobileForRepeatGuest;

  @HiveField(41)
  final bool? checkUniqueIdForRepeatGuest;

  @HiveField(42)
  final bool? allowNewResponseAlert;

  @HiveField(43)
  final bool? allowLowRatingResponseAlert;

  @HiveField(44)
  final bool? allowThanksToGuestEmailAlert;

  @HiveField(45)
  final bool? allowThanksGuestSmsAlert;

  @HiveField(46)
  final bool? allowLowRateGuestSmsAlert;

  @HiveField(47)
  final int? tabletResponses;

  @HiveField(48)
  final int? mobileResponses;

  @HiveField(49)
  final int? webResponses;

  @HiveField(50)
  final bool? isTemplate;

  @HiveField(51)
  final bool? isClickThroughSurvey;

  @HiveField(52)
  final bool? isPasswordRequiredForExitSurvey;

  @HiveField(53)
  final bool? isPwdReqForGestureExit;

  @HiveField(54)
  final bool? isWebSurveyPublished;

  @HiveField(55)
  final bool? otpValidation;

  @HiveField(56)
  final bool? isTemplateOptionUsed;

  @HiveField(57)
  final dynamic themeApplied;

  @HiveField(58)
  final String? surveyBgColor;

  @HiveField(59)
  final bool? applySurveyBackgroundImage;

  @HiveField(60)
  final SurveyBgGalleryImageId? surveyBgGalleryImageId;

  @HiveField(61)
  final String? fontFamily;

  @HiveField(62)
  final String? fontSize;

  @HiveField(63)
  final bool? applyCustomFontSize;

  @HiveField(64)
  final String? labelCustomFontSize;

  @HiveField(65)
  final String? optionCustomFontSize;

  @HiveField(66)
  final String? fontColorLabel;

  @HiveField(67)
  final String? fontColorValue;

  @HiveField(68)
  final String? fontColorSelectedBtn;

  @HiveField(69)
  final bool? applyTopStripColor;

  @HiveField(70)
  final String? topStripColor;

  @HiveField(71)
  final bool? applyTopStripAlpha;

  @HiveField(72)
  final String? previousNextArrowColor;

  @HiveField(73)
  final String? previousNextTextColor;

  @HiveField(74)
  final String? previousNextPosition;

  @HiveField(75)
  final String? paginationStyle;

  @HiveField(76)
  final bool? showNumberInPaging;

  @HiveField(77)
  final bool? isIconIntialStateBright;

  @HiveField(78)
  final String? buttonColor;

  @HiveField(79)
  final String? buttonSelectedColor;

  @HiveField(80)
  final String? buttonFontColor;

  @HiveField(81)
  final String? buttonSelectedFontColor;

  @HiveField(82)
  final String? navigationButtonPosition;

  @HiveField(83)
  final String? doneButtonPosition;

  @HiveField(84)
  final String? doneButtonColor;

  @HiveField(85)
  final String? doneButtonTextColor;

  @HiveField(86)
  final String? defaultLanguageCode;

  @HiveField(87)
  final dynamic defaultCommentField;

  @HiveField(88)
  final Map<String, SurveyTranslation>? translations;

  @HiveField(89)
  final IntroPage? introPage;

  @HiveField(90)
  final ThankyouPage? thankyouPage;

  @HiveField(91)
  final LanguagePage? languagePage;

  @HiveField(92)
  final int? sequenceOrder;

  @HiveField(93)
  final int? widgetSequenceOrder;

  @HiveField(94)
  final List<SurveyScreenModel>? surveyScreens;

  @HiveField(95)
  final bool? hideInDevice;

  @HiveField(96)
  final bool? isActive;

  @HiveField(97)
  final bool? isDeleted;

  @HiveField(98)
  final bool? isSuspicious;

  @HiveField(99)
  final bool? isTrusted;

  @HiveField(100)
  final bool? pinned;

  @HiveField(101)
  final String? type;

  @HiveField(102)
  final bool? showPollResults;

  @HiveField(103)
  final bool? showQuizScore;

  @HiveField(104)
  final bool? showQuizAnswers;

  @HiveField(105)
  final bool? useCheckedAnswersForScoreCal;

  @HiveField(106)
  final bool? showLeaderboard;

  @HiveField(107)
  final int? quizTotalTime;

  @HiveField(108)
  final int? quizQuestionFixedTime;

  @HiveField(109)
  final String? quizTimeType;

  @HiveField(110)
  final bool? isQuizTimed;

  @HiveField(111)
  final bool? updateCacheSurvey;

  @HiveField(112)
  final bool? showAsteriskInRequiredField;

  @HiveField(113)
  final bool? allowPartialSubmission;

  @HiveField(114)
  final bool? screenJumpAnimation;

  @HiveField(115)
  final bool? choiceMarkingAnimation;

  @HiveField(116)
  final String? thankyouOptionTopText;

  @HiveField(117)
  final String? thankyouOptionBottomText;

  @HiveField(118)
  final String? lastModifierIpAddress;

  @HiveField(119)
  final String? lastModifierUserAgent;

  @HiveField(120)
  final String? lastModifierAction;

  // @HiveField(121)
  // final String? surveyCloseRedirectUrl;

  // final List<dynamic> staffScreen;

  @HiveField(121)
  final String? id;
  @HiveField(122)
  final String? name;
  @HiveField(123)
  final String? shortCode;
  @HiveField(124)
  final DateTime? createdDate;
  @HiveField(125)
  final DateTime? modifiedDate;
  @HiveField(126)
  final DateTime? builderLastModifiedDate;
  @HiveField(127)
  final int? preMongifiedId;
  @HiveField(128)
  final String? companyId;
  @HiveField(129)
  final String? createdBy;
  @HiveField(130)
  final String? modifiedBy;
  @HiveField(131)
  final String s3GalleryImageUrl;

  factory SurveyModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }

    // print("s3image ${json["s3GalleryImageUrl"]}");
    return SurveyModel(
      newVersion: json["newVersion"],
      // locationTags: json["locationTags"] == null ? [] : List<dynamic>.from(json["locationTags"]!.map((x) => x)),
      // locations: json["locations"] == null ? [] : List<dynamic>.from(json["locations"]!.map((x) => x)),
      // distributionChannels: json["distributionChannels"] == null ? [] : List<dynamic>.from(json["distributionChannels"]!.map((x) => x)),
      s3GalleryImageUrl: json["s3GalleryImageUrl"] ??
          "https://zonkafeedback-gallery.s3.amazonaws.com/img_gallery/",
      description: json["description"],
      createdUsingAi: json["createdUsingAI"],
      isAiAssisted: json["isAIAssisted"],
      isUsedInTemplate: json["isUsedInTemplate"],
      webSurveyTitle: json["webSurveyTitle"],
      webViewMode: json["webViewMode"],
      logoGalleryImageId: json["logoGalleryImageId"] == null
          ? null
          : LogoGalleryImageId.fromJson(json["logoGalleryImageId"]),
      hideLogoInDevice: json["hideLogoInDevice"],
      theme: json["theme"],
      viewMode: json["viewMode"],
      mode: json["mode"],
      isMobileSurvey: json["isMobileSurvey"],
      showIntroPage: json["showIntroPage"],
      showThankyouPage: json["showThankyouPage"],
      showStaffScreenInAssistedMode: json["showStaffScreenInAssistedMode"],
      staffScreenPosition: json["staffScreenPosition"],
      scale: json["scale"],
      minPercentage: json["minPercentage"],
      maxPercentage: json["maxPercentage"],
      thankyouScreenTimeOut: json["thankyouScreenTimeOut"],
      showInactiveAlert: json["showInactiveAlert"],
      appInactiveTimeout: json["appInactiveTimeout"],
      showExitButtonOnIntro: json["showExitButtonOnIntro"],
      showExitButtonOnThankyou: json["showExitButtonOnThankyou"],
      allowGestureToExit: json["allowGestureToExit"],
      exitPassword: json["exitPassword"],
      exitPin: json["exitPin"],
      googleAnalyticsTrackingId: json["googleAnalyticsTrackingId"],
      isEmailTrackingEnabled: json["isEmailTrackingEnabled"],
      isSmsTrackingEnabled: json["isSmsTrackingEnabled"],
      redirectUrlFromWebSurvey: json["redirectUrlFromWebSurvey"],
      redirectWebSurveyIn: json["redirectWebSurveyIn"],
      showSkipButtonInsteadOfNext: json["showSkipButtonInsteadOfNext"],
      hideDoneButtonInClickThrough: json["hideDoneButtonInClickThrough"],
      switchLanguageScreenDisplay: json["switchLanguageScreenDisplay"],
      switchLanguageButtonDisplay: json["switchLanguageButtonDisplay"],
      languagePickView: json["languagePickView"],
      hidePrevNextButton: json["hidePrevNextButton"],
      checkEmailForRepeatGuest: json["checkEmailForRepeatGuest"],
      checkMobileForRepeatGuest: json["checkMobileForRepeatGuest"],
      checkUniqueIdForRepeatGuest: json["checkUniqueIdForRepeatGuest"],
      allowNewResponseAlert: json["allowNewResponseAlert"],
      allowLowRatingResponseAlert: json["allowLowRatingResponseAlert"],
      allowThanksToGuestEmailAlert: json["allowThanksToGuestEmailAlert"],
      allowThanksGuestSmsAlert: json["allowThanksGuestSmsAlert"],
      allowLowRateGuestSmsAlert: json["allowLowRateGuestSmsAlert"],
      tabletResponses: json["tabletResponses"],
      mobileResponses: json["mobileResponses"],
      webResponses: json["webResponses"],
      isTemplate: json["isTemplate"],
      isClickThroughSurvey: json["isClickThroughSurvey"],
      isPasswordRequiredForExitSurvey: json["isPasswordRequiredForExitSurvey"],
      isPwdReqForGestureExit: json["isPwdReqForGestureExit"],
      isWebSurveyPublished: json["isWebSurveyPublished"],
      otpValidation: json["otpValidation"],
      isTemplateOptionUsed: json["isTemplateOptionUsed"],
      themeApplied: json["themeApplied"],
      surveyBgColor: json["surveyBgColor"],
      applySurveyBackgroundImage: json["applySurveyBackgroundImage"],
      surveyBgGalleryImageId: json["surveyBgGalleryImageId"] == null
          ? json["surveyBgGalleryImageId"]
          : SurveyBgGalleryImageId.fromJson(json["surveyBgGalleryImageId"]),
      fontFamily: json["fontFamily"],
      fontSize: json["fontSize"],
      applyCustomFontSize: json["applyCustomFontSize"],
      labelCustomFontSize: json["labelCustomFontSize"],
      optionCustomFontSize: json["optionCustomFontSize"],
      fontColorLabel: json["fontColorLabel"],
      fontColorValue: json["fontColorValue"],
      fontColorSelectedBtn: json["fontColorSelectedBtn"],
      applyTopStripColor: json["applyTopStripColor"],
      topStripColor: json["topStripColor"],
      applyTopStripAlpha: json["applyTopStripAlpha"],
      previousNextArrowColor: json["previousNextArrowColor"],
      previousNextTextColor: json["previousNextTextColor"],
      previousNextPosition: json["previousNextPosition"],
      paginationStyle: json["paginationStyle"],
      showNumberInPaging: json["showNumberInPaging"],
      isIconIntialStateBright: json["isIconIntialStateBright"],
      buttonColor: json["buttonColor"],
      buttonSelectedColor: json["buttonSelectedColor"],
      buttonFontColor: json["buttonFontColor"],
      buttonSelectedFontColor: json["buttonSelectedFontColor"],
      navigationButtonPosition: json["navigationButtonPosition"],
      doneButtonPosition: json["doneButtonPosition"],
      doneButtonColor: json["doneButtonColor"],
      doneButtonTextColor: json["doneButtonTextColor"],
      defaultLanguageCode: json["defaultLanguageCode"],
      defaultCommentField: json["defaultCommentField"],
      translations: json["translations"] == null
          ? null
          : Map.from(json["translations"]).map((k, v) =>
              MapEntry<String, SurveyTranslation>(
                  k, SurveyTranslation.fromJson(v))),
      introPage: json["introPage"] == null
          ? null
          : IntroPage.fromJson(json["introPage"]),
      thankyouPage: json["thankyouPage"] == null
          ? null
          : ThankyouPage.fromJson(json["thankyouPage"]),
      languagePage: json["languagePage"] == null
          ? null
          : LanguagePage.fromJson(json["languagePage"]),
      sequenceOrder: json["sequenceOrder"],
      widgetSequenceOrder: json["widgetSequenceOrder"],
      surveyScreens: json["surveyScreens"] == null
          ? []
          : List<SurveyScreenModel>.from(
              json["surveyScreens"]!.map((x) => SurveyScreenModel.fromJson(x))),
      // staffScreen: json["staffScreen"] == null ? [] : List<dynamic>.from(json["staffScreen"]!.map((x) => x)),
      hideInDevice: json["hideInDevice"],
      isActive: json["isActive"],
      isDeleted: json["isDeleted"],
      isSuspicious: json["isSuspicious"],
      isTrusted: json["isTrusted"],
      pinned: json["pinned"],
      type: json["type"],
      showPollResults: json["showPollResults"],
      showQuizScore: json["showQuizScore"],
      showQuizAnswers: json["showQuizAnswers"],
      useCheckedAnswersForScoreCal: json["useCheckedAnswersForScoreCal"],
      showLeaderboard: json["showLeaderboard"],
      quizTotalTime: json["quizTotalTime"],
      quizQuestionFixedTime: json["quizQuestionFixedTime"],
      quizTimeType: json["quizTimeType"],
      isQuizTimed: json["isQuizTimed"],
      updateCacheSurvey: json["updateCacheSurvey"],
      showAsteriskInRequiredField: json["showAsteriskInRequiredField"],
      allowPartialSubmission: json["allowPartialSubmission"],
      screenJumpAnimation: json["screenJumpAnimation"],
      choiceMarkingAnimation: json["choiceMarkingAnimation"],
      thankyouOptionTopText: json["thankyouOptionTopText"],
      thankyouOptionBottomText: json["thankyouOptionBottomText"],
      lastModifierIpAddress: json["lastModifierIPAddress"],
      lastModifierUserAgent: json["lastModifierUserAgent"],
      lastModifierAction: json["lastModifierAction"],
      id: json["_id"],
      name: json["name"],
      shortCode: json["shortCode"],
      createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
      modifiedDate: DateTime.tryParse(json["modifiedDate"] ?? ""),
      builderLastModifiedDate:
          DateTime.tryParse(json["builderLastModifiedDate"] ?? ""),
      preMongifiedId: json["pre_mongified_id"],
      companyId: json["companyId"],
      createdBy: json["createdBy"],
      modifiedBy: json["modifiedBy"],
    );
  }
}
