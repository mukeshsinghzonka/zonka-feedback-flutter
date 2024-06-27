
import 'package:zonka_feedback/feedback/data/data_model_new/intro_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_screen_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_translation_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/thankyou_model.dart';

class SurveyModel {
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
      
    });

    final bool? newVersion;
    // final List<dynamic> locationTags;
    // final List<dynamic> locations;
    // final List<dynamic> distributionChannels;
    final String? description;
    final bool? createdUsingAi;
    final bool? isAiAssisted;
    final bool? isUsedInTemplate;
    final String? webSurveyTitle;
    final String? webViewMode;
    final dynamic logoGalleryImageId;
    final bool? hideLogoInDevice;
    final String? theme;
    final String? viewMode;
    final String? mode;
    final bool? isMobileSurvey;
    final bool? showIntroPage;
    final bool? showThankyouPage;
    final bool? showStaffScreenInAssistedMode;
    final String? staffScreenPosition;
    final int? scale;
    final int? minPercentage;
    final int? maxPercentage;
    final int? thankyouScreenTimeOut;
    final bool? showInactiveAlert;
    final int? appInactiveTimeout;
    final bool? showExitButtonOnIntro;
    final bool? showExitButtonOnThankyou;
    final bool? allowGestureToExit;
    final String? exitPassword;
    final String? exitPin;
    final String? googleAnalyticsTrackingId;
    final bool? isEmailTrackingEnabled;
    final bool? isSmsTrackingEnabled;
    final String? redirectUrlFromWebSurvey;
    final int? redirectWebSurveyIn;
    final bool? showSkipButtonInsteadOfNext;
    final bool? hideDoneButtonInClickThrough;
    final String? switchLanguageScreenDisplay;
    final String? switchLanguageButtonDisplay;
    final String? languagePickView;
    final String? hidePrevNextButton;
    final bool? checkEmailForRepeatGuest;
    final bool? checkMobileForRepeatGuest;
    final bool? checkUniqueIdForRepeatGuest;
    final bool? allowNewResponseAlert;
    final bool? allowLowRatingResponseAlert;
    final bool? allowThanksToGuestEmailAlert;
    final bool? allowThanksGuestSmsAlert;
    final bool? allowLowRateGuestSmsAlert;
    final int? tabletResponses;
    final int? mobileResponses;
    final int? webResponses;
    final bool? isTemplate;
    final bool? isClickThroughSurvey;
    final bool? isPasswordRequiredForExitSurvey;
    final bool? isPwdReqForGestureExit;
    final bool? isWebSurveyPublished;
    final bool? otpValidation;
    final bool? isTemplateOptionUsed;
    final dynamic themeApplied;
    final String? surveyBgColor;
    final bool? applySurveyBackgroundImage;
    final dynamic surveyBgGalleryImageId;
    final String? fontFamily;
    final String? fontSize;
    final bool? applyCustomFontSize;
    final String? labelCustomFontSize;
    final String? optionCustomFontSize;
    final String? fontColorLabel;
    final String? fontColorValue;
    final String? fontColorSelectedBtn;
    final bool? applyTopStripColor;
    final String? topStripColor;
    final bool? applyTopStripAlpha;
    final String? previousNextArrowColor;
    final String? previousNextTextColor;
    final String? previousNextPosition;
    final String? paginationStyle;
    final bool? showNumberInPaging;
    final bool? isIconIntialStateBright;
    final String? buttonColor;
    final String? buttonSelectedColor;
    final String? buttonFontColor;
    final String? buttonSelectedFontColor;
    final String? navigationButtonPosition;
    final String? doneButtonPosition;
    final String? doneButtonColor;
    final String? doneButtonTextColor;
    final String? defaultLanguageCode;
    final dynamic defaultCommentField;
    final Map<String, SurveyTranslation> ? translations;
    final IntroPage? introPage;
    final ThankyouPage? thankyouPage;
    final LanguagePage? languagePage;
    final int? sequenceOrder;
    final int? widgetSequenceOrder;
    final List<SurveyScreen> surveyScreens;
    // final List<dynamic> staffScreen;
    final bool? hideInDevice;
    final bool? isActive;
    final bool? isDeleted;
    final bool? isSuspicious;
    final bool? isTrusted;
    final bool? pinned;
    final String? type;
    final bool? showPollResults;
    final bool? showQuizScore;
    final bool? showQuizAnswers;
    final bool? useCheckedAnswersForScoreCal;
    final bool? showLeaderboard;
    final int? quizTotalTime;
    final int? quizQuestionFixedTime;
    final String? quizTimeType;
    final bool? isQuizTimed;
    final bool? updateCacheSurvey;
    final bool? showAsteriskInRequiredField;
    final bool? allowPartialSubmission;
    final bool? screenJumpAnimation;
    final bool? choiceMarkingAnimation;
    final String? thankyouOptionTopText;
    final String? thankyouOptionBottomText;
    final String? lastModifierIpAddress;
    final String? lastModifierUserAgent;
    final String? lastModifierAction;
    final String? id;
    final String? name;
    final String? shortCode;
    final DateTime? createdDate;
    final DateTime? modifiedDate;
    final DateTime? builderLastModifiedDate;
    final int? preMongifiedId;
    final String? companyId;
    final String? createdBy;
    final String? modifiedBy;
   

    factory SurveyModel.fromJson(Map<String, dynamic> json){ 
        return SurveyModel(
            newVersion: json["newVersion"],
            // locationTags: json["locationTags"] == null ? [] : List<dynamic>.from(json["locationTags"]!.map((x) => x)),
            // locations: json["locations"] == null ? [] : List<dynamic>.from(json["locations"]!.map((x) => x)),
            // distributionChannels: json["distributionChannels"] == null ? [] : List<dynamic>.from(json["distributionChannels"]!.map((x) => x)),
            description: json["description"],
            createdUsingAi: json["createdUsingAI"],
            isAiAssisted: json["isAIAssisted"],
            isUsedInTemplate: json["isUsedInTemplate"],
            webSurveyTitle: json["webSurveyTitle"],
            webViewMode: json["webViewMode"],
            logoGalleryImageId: json["logoGalleryImageId"],
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
            surveyBgGalleryImageId: json["surveyBgGalleryImageId"],
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
            translations:json["translations"]==null?null: Map.from(json["translations"]).map((k, v) => MapEntry<String, SurveyTranslation>(k, SurveyTranslation.fromJson(v))),
            introPage: json["introPage"] == null ? null : IntroPage.fromJson(json["introPage"]),
            thankyouPage: json["thankyouPage"] == null ? null : ThankyouPage.fromJson(json["thankyouPage"]),
            languagePage: json["languagePage"] == null ? null : LanguagePage.fromJson(json["languagePage"]),
            sequenceOrder: json["sequenceOrder"],
            widgetSequenceOrder: json["widgetSequenceOrder"],
            surveyScreens: json["surveyScreens"] == null ? [] : List<SurveyScreen>.from(json["surveyScreens"]!.map((x) => SurveyScreen.fromJson(x))),
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
            builderLastModifiedDate: DateTime.tryParse(json["builderLastModifiedDate"] ?? ""),
            preMongifiedId: json["pre_mongified_id"],
            companyId: json["companyId"],
            createdBy: json["createdBy"],
            modifiedBy: json["modifiedBy"],
        );
    }

}



















