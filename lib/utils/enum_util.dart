enum SetBaseUrl { US, EU, EMAIL, LOGIN }

enum ServerType { NIGHTLY, PROD }

enum ScreenActiveEnum {
  SurveyScreen,
  SettingsScreen,
  FeedbackScreen,
  HelpScreen,
  RequestDemoScreen,
  WebLogInScreen,
}

enum ApiCallStatus { Loading, Success, Error, Initial }

enum SurveyScreenenum {
  buttonChoice,
  multipleButtonChoice,
  radioChoice,
  dropdownChoice,
  checkboxChoice,
  pictureChoice,
  multiplePictureChoice,
  npsRating,
  npsQuestion,
  cesRating,
  csatButtonRating,
  scaleRating,
  rankingRating,
  starRating,
  emotionRating,
  textWidget,
  dateWidget,
  imageWidget,
  welcomeWidget,
  thankYouWidget,
  legalTerm,
  cameraWidget,
  cesquestion,
  pictureRating,
  heartRating,
  circleRating,
  radioRatingLable
}

enum SpecialSettingVal { exact, range }

enum ScreenValidationErrorType{
  REQUIRED,
  WRONGSELECTION,

}


