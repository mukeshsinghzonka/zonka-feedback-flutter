// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyModelAdapter extends TypeAdapter<SurveyModel> {
  @override
  final int typeId = 24;

  @override
  SurveyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyModel(
      newVersion: fields[0] as bool?,
      description: fields[1] as String?,
      createdUsingAi: fields[2] as bool?,
      isAiAssisted: fields[3] as bool?,
      isUsedInTemplate: fields[4] as bool?,
      webSurveyTitle: fields[5] as String?,
      webViewMode: fields[6] as String?,
      logoGalleryImageId: fields[7] as LogoGalleryImageId?,
      hideLogoInDevice: fields[8] as bool?,
      theme: fields[9] as String?,
      viewMode: fields[10] as String?,
      mode: fields[11] as String?,
      isMobileSurvey: fields[12] as bool?,
      showIntroPage: fields[13] as bool?,
      showThankyouPage: fields[14] as bool?,
      showStaffScreenInAssistedMode: fields[15] as bool?,
      staffScreenPosition: fields[16] as String?,
      scale: fields[17] as int?,
      minPercentage: fields[18] as int?,
      maxPercentage: fields[19] as int?,
      thankyouScreenTimeOut: fields[20] as int?,
      showInactiveAlert: fields[21] as bool?,
      appInactiveTimeout: fields[22] as int?,
      showExitButtonOnIntro: fields[23] as bool?,
      showExitButtonOnThankyou: fields[24] as bool?,
      allowGestureToExit: fields[25] as bool?,
      exitPassword: fields[26] as String?,
      exitPin: fields[27] as String?,
      googleAnalyticsTrackingId: fields[28] as String?,
      isEmailTrackingEnabled: fields[29] as bool?,
      isSmsTrackingEnabled: fields[30] as bool?,
      redirectUrlFromWebSurvey: fields[31] as String?,
      redirectWebSurveyIn: fields[32] as int?,
      showSkipButtonInsteadOfNext: fields[33] as bool?,
      hideDoneButtonInClickThrough: fields[34] as bool?,
      switchLanguageScreenDisplay: fields[35] as String?,
      switchLanguageButtonDisplay: fields[36] as String?,
      languagePickView: fields[37] as String?,
      hidePrevNextButton: fields[38] as String?,
      checkEmailForRepeatGuest: fields[39] as bool?,
      checkMobileForRepeatGuest: fields[40] as bool?,
      checkUniqueIdForRepeatGuest: fields[41] as bool?,
      allowNewResponseAlert: fields[42] as bool?,
      allowLowRatingResponseAlert: fields[43] as bool?,
      allowThanksToGuestEmailAlert: fields[44] as bool?,
      allowThanksGuestSmsAlert: fields[45] as bool?,
      allowLowRateGuestSmsAlert: fields[46] as bool?,
      tabletResponses: fields[47] as int?,
      mobileResponses: fields[48] as int?,
      webResponses: fields[49] as int?,
      isTemplate: fields[50] as bool?,
      isClickThroughSurvey: fields[51] as bool?,
      isPasswordRequiredForExitSurvey: fields[52] as bool?,
      isPwdReqForGestureExit: fields[53] as bool?,
      isWebSurveyPublished: fields[54] as bool?,
      otpValidation: fields[55] as bool?,
      isTemplateOptionUsed: fields[56] as bool?,
      themeApplied: fields[57] as dynamic,
      surveyBgColor: fields[58] as String?,
      applySurveyBackgroundImage: fields[59] as bool?,
      surveyBgGalleryImageId: fields[60] as SurveyBgGalleryImageId?,
      fontFamily: fields[61] as String?,
      fontSize: fields[62] as String?,
      applyCustomFontSize: fields[63] as bool?,
      labelCustomFontSize: fields[64] as String?,
      optionCustomFontSize: fields[65] as String?,
      fontColorLabel: fields[66] as String?,
      fontColorValue: fields[67] as String?,
      fontColorSelectedBtn: fields[68] as String?,
      applyTopStripColor: fields[69] as bool?,
      topStripColor: fields[70] as String?,
      applyTopStripAlpha: fields[71] as bool?,
      previousNextArrowColor: fields[72] as String?,
      previousNextTextColor: fields[73] as String?,
      previousNextPosition: fields[74] as String?,
      paginationStyle: fields[75] as String?,
      showNumberInPaging: fields[76] as bool?,
      isIconIntialStateBright: fields[77] as bool?,
      buttonColor: fields[78] as String?,
      buttonSelectedColor: fields[79] as String?,
      buttonFontColor: fields[80] as String?,
      buttonSelectedFontColor: fields[81] as String?,
      navigationButtonPosition: fields[82] as String?,
      doneButtonPosition: fields[83] as String?,
      doneButtonColor: fields[84] as String?,
      doneButtonTextColor: fields[85] as String?,
      defaultLanguageCode: fields[86] as String?,
      defaultCommentField: fields[87] as dynamic,
      translations: (fields[88] as Map?)?.cast<String, SurveyTranslation>(),
      introPage: fields[89] as IntroPage?,
      thankyouPage: fields[90] as ThankyouPage?,
      languagePage: fields[91] as LanguagePage?,
      sequenceOrder: fields[92] as int?,
      widgetSequenceOrder: fields[93] as int?,
      surveyScreens: (fields[94] as List?)?.cast<SurveyScreenModel>(),
      hideInDevice: fields[95] as bool?,
      isActive: fields[96] as bool?,
      isDeleted: fields[97] as bool?,
      isSuspicious: fields[98] as bool?,
      isTrusted: fields[99] as bool?,
      pinned: fields[100] as bool?,
      type: fields[101] as String?,
      showPollResults: fields[102] as bool?,
      showQuizScore: fields[103] as bool?,
      showQuizAnswers: fields[104] as bool?,
      useCheckedAnswersForScoreCal: fields[105] as bool?,
      showLeaderboard: fields[106] as bool?,
      quizTotalTime: fields[107] as int?,
      quizQuestionFixedTime: fields[108] as int?,
      quizTimeType: fields[109] as String?,
      isQuizTimed: fields[110] as bool?,
      updateCacheSurvey: fields[111] as bool?,
      showAsteriskInRequiredField: fields[112] as bool?,
      allowPartialSubmission: fields[113] as bool?,
      screenJumpAnimation: fields[114] as bool?,
      choiceMarkingAnimation: fields[115] as bool?,
      thankyouOptionTopText: fields[116] as String?,
      thankyouOptionBottomText: fields[117] as String?,
      lastModifierIpAddress: fields[118] as String?,
      lastModifierUserAgent: fields[119] as String?,
      lastModifierAction: fields[120] as String?,
      id: fields[121] as String?,
      name: fields[122] as String?,
      shortCode: fields[123] as String?,
      createdDate: fields[124] as DateTime?,
      modifiedDate: fields[125] as DateTime?,
      builderLastModifiedDate: fields[126] as DateTime?,
      preMongifiedId: fields[127] as int?,
      companyId: fields[128] as String?,
      createdBy: fields[129] as String?,
      modifiedBy: fields[130] as String?,
      s3GalleryImageUrl: fields[131] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyModel obj) {
    writer
      ..writeByte(132)
      ..writeByte(0)
      ..write(obj.newVersion)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.createdUsingAi)
      ..writeByte(3)
      ..write(obj.isAiAssisted)
      ..writeByte(4)
      ..write(obj.isUsedInTemplate)
      ..writeByte(5)
      ..write(obj.webSurveyTitle)
      ..writeByte(6)
      ..write(obj.webViewMode)
      ..writeByte(7)
      ..write(obj.logoGalleryImageId)
      ..writeByte(8)
      ..write(obj.hideLogoInDevice)
      ..writeByte(9)
      ..write(obj.theme)
      ..writeByte(10)
      ..write(obj.viewMode)
      ..writeByte(11)
      ..write(obj.mode)
      ..writeByte(12)
      ..write(obj.isMobileSurvey)
      ..writeByte(13)
      ..write(obj.showIntroPage)
      ..writeByte(14)
      ..write(obj.showThankyouPage)
      ..writeByte(15)
      ..write(obj.showStaffScreenInAssistedMode)
      ..writeByte(16)
      ..write(obj.staffScreenPosition)
      ..writeByte(17)
      ..write(obj.scale)
      ..writeByte(18)
      ..write(obj.minPercentage)
      ..writeByte(19)
      ..write(obj.maxPercentage)
      ..writeByte(20)
      ..write(obj.thankyouScreenTimeOut)
      ..writeByte(21)
      ..write(obj.showInactiveAlert)
      ..writeByte(22)
      ..write(obj.appInactiveTimeout)
      ..writeByte(23)
      ..write(obj.showExitButtonOnIntro)
      ..writeByte(24)
      ..write(obj.showExitButtonOnThankyou)
      ..writeByte(25)
      ..write(obj.allowGestureToExit)
      ..writeByte(26)
      ..write(obj.exitPassword)
      ..writeByte(27)
      ..write(obj.exitPin)
      ..writeByte(28)
      ..write(obj.googleAnalyticsTrackingId)
      ..writeByte(29)
      ..write(obj.isEmailTrackingEnabled)
      ..writeByte(30)
      ..write(obj.isSmsTrackingEnabled)
      ..writeByte(31)
      ..write(obj.redirectUrlFromWebSurvey)
      ..writeByte(32)
      ..write(obj.redirectWebSurveyIn)
      ..writeByte(33)
      ..write(obj.showSkipButtonInsteadOfNext)
      ..writeByte(34)
      ..write(obj.hideDoneButtonInClickThrough)
      ..writeByte(35)
      ..write(obj.switchLanguageScreenDisplay)
      ..writeByte(36)
      ..write(obj.switchLanguageButtonDisplay)
      ..writeByte(37)
      ..write(obj.languagePickView)
      ..writeByte(38)
      ..write(obj.hidePrevNextButton)
      ..writeByte(39)
      ..write(obj.checkEmailForRepeatGuest)
      ..writeByte(40)
      ..write(obj.checkMobileForRepeatGuest)
      ..writeByte(41)
      ..write(obj.checkUniqueIdForRepeatGuest)
      ..writeByte(42)
      ..write(obj.allowNewResponseAlert)
      ..writeByte(43)
      ..write(obj.allowLowRatingResponseAlert)
      ..writeByte(44)
      ..write(obj.allowThanksToGuestEmailAlert)
      ..writeByte(45)
      ..write(obj.allowThanksGuestSmsAlert)
      ..writeByte(46)
      ..write(obj.allowLowRateGuestSmsAlert)
      ..writeByte(47)
      ..write(obj.tabletResponses)
      ..writeByte(48)
      ..write(obj.mobileResponses)
      ..writeByte(49)
      ..write(obj.webResponses)
      ..writeByte(50)
      ..write(obj.isTemplate)
      ..writeByte(51)
      ..write(obj.isClickThroughSurvey)
      ..writeByte(52)
      ..write(obj.isPasswordRequiredForExitSurvey)
      ..writeByte(53)
      ..write(obj.isPwdReqForGestureExit)
      ..writeByte(54)
      ..write(obj.isWebSurveyPublished)
      ..writeByte(55)
      ..write(obj.otpValidation)
      ..writeByte(56)
      ..write(obj.isTemplateOptionUsed)
      ..writeByte(57)
      ..write(obj.themeApplied)
      ..writeByte(58)
      ..write(obj.surveyBgColor)
      ..writeByte(59)
      ..write(obj.applySurveyBackgroundImage)
      ..writeByte(60)
      ..write(obj.surveyBgGalleryImageId)
      ..writeByte(61)
      ..write(obj.fontFamily)
      ..writeByte(62)
      ..write(obj.fontSize)
      ..writeByte(63)
      ..write(obj.applyCustomFontSize)
      ..writeByte(64)
      ..write(obj.labelCustomFontSize)
      ..writeByte(65)
      ..write(obj.optionCustomFontSize)
      ..writeByte(66)
      ..write(obj.fontColorLabel)
      ..writeByte(67)
      ..write(obj.fontColorValue)
      ..writeByte(68)
      ..write(obj.fontColorSelectedBtn)
      ..writeByte(69)
      ..write(obj.applyTopStripColor)
      ..writeByte(70)
      ..write(obj.topStripColor)
      ..writeByte(71)
      ..write(obj.applyTopStripAlpha)
      ..writeByte(72)
      ..write(obj.previousNextArrowColor)
      ..writeByte(73)
      ..write(obj.previousNextTextColor)
      ..writeByte(74)
      ..write(obj.previousNextPosition)
      ..writeByte(75)
      ..write(obj.paginationStyle)
      ..writeByte(76)
      ..write(obj.showNumberInPaging)
      ..writeByte(77)
      ..write(obj.isIconIntialStateBright)
      ..writeByte(78)
      ..write(obj.buttonColor)
      ..writeByte(79)
      ..write(obj.buttonSelectedColor)
      ..writeByte(80)
      ..write(obj.buttonFontColor)
      ..writeByte(81)
      ..write(obj.buttonSelectedFontColor)
      ..writeByte(82)
      ..write(obj.navigationButtonPosition)
      ..writeByte(83)
      ..write(obj.doneButtonPosition)
      ..writeByte(84)
      ..write(obj.doneButtonColor)
      ..writeByte(85)
      ..write(obj.doneButtonTextColor)
      ..writeByte(86)
      ..write(obj.defaultLanguageCode)
      ..writeByte(87)
      ..write(obj.defaultCommentField)
      ..writeByte(88)
      ..write(obj.translations)
      ..writeByte(89)
      ..write(obj.introPage)
      ..writeByte(90)
      ..write(obj.thankyouPage)
      ..writeByte(91)
      ..write(obj.languagePage)
      ..writeByte(92)
      ..write(obj.sequenceOrder)
      ..writeByte(93)
      ..write(obj.widgetSequenceOrder)
      ..writeByte(94)
      ..write(obj.surveyScreens)
      ..writeByte(95)
      ..write(obj.hideInDevice)
      ..writeByte(96)
      ..write(obj.isActive)
      ..writeByte(97)
      ..write(obj.isDeleted)
      ..writeByte(98)
      ..write(obj.isSuspicious)
      ..writeByte(99)
      ..write(obj.isTrusted)
      ..writeByte(100)
      ..write(obj.pinned)
      ..writeByte(101)
      ..write(obj.type)
      ..writeByte(102)
      ..write(obj.showPollResults)
      ..writeByte(103)
      ..write(obj.showQuizScore)
      ..writeByte(104)
      ..write(obj.showQuizAnswers)
      ..writeByte(105)
      ..write(obj.useCheckedAnswersForScoreCal)
      ..writeByte(106)
      ..write(obj.showLeaderboard)
      ..writeByte(107)
      ..write(obj.quizTotalTime)
      ..writeByte(108)
      ..write(obj.quizQuestionFixedTime)
      ..writeByte(109)
      ..write(obj.quizTimeType)
      ..writeByte(110)
      ..write(obj.isQuizTimed)
      ..writeByte(111)
      ..write(obj.updateCacheSurvey)
      ..writeByte(112)
      ..write(obj.showAsteriskInRequiredField)
      ..writeByte(113)
      ..write(obj.allowPartialSubmission)
      ..writeByte(114)
      ..write(obj.screenJumpAnimation)
      ..writeByte(115)
      ..write(obj.choiceMarkingAnimation)
      ..writeByte(116)
      ..write(obj.thankyouOptionTopText)
      ..writeByte(117)
      ..write(obj.thankyouOptionBottomText)
      ..writeByte(118)
      ..write(obj.lastModifierIpAddress)
      ..writeByte(119)
      ..write(obj.lastModifierUserAgent)
      ..writeByte(120)
      ..write(obj.lastModifierAction)
      ..writeByte(121)
      ..write(obj.id)
      ..writeByte(122)
      ..write(obj.name)
      ..writeByte(123)
      ..write(obj.shortCode)
      ..writeByte(124)
      ..write(obj.createdDate)
      ..writeByte(125)
      ..write(obj.modifiedDate)
      ..writeByte(126)
      ..write(obj.builderLastModifiedDate)
      ..writeByte(127)
      ..write(obj.preMongifiedId)
      ..writeByte(128)
      ..write(obj.companyId)
      ..writeByte(129)
      ..write(obj.createdBy)
      ..writeByte(130)
      ..write(obj.modifiedBy)
      ..writeByte(131)
      ..write(obj.s3GalleryImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
