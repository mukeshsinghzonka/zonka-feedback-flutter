class SurveyTranslation {
    SurveyTranslation({
        required this.clearButText,
        required this.getStartedButText,
        required this.nextArrowText,
        required this.previousArrowText,
        required this.skipNavText,
        required this.submitButtonText,
    });

    final String? clearButText;
    final String? getStartedButText;
    final String? nextArrowText;
    final String? previousArrowText;
    final String? skipNavText;
    final String? submitButtonText;

    factory SurveyTranslation.fromJson(Map<String, dynamic> ?json){ 
        return SurveyTranslation(
            clearButText: json?["clearButText"],
            getStartedButText: json?["getStartedButText"],
            nextArrowText: json?["nextArrowText"],
            previousArrowText: json?["previousArrowText"],
            skipNavText: json?["skipNavText"],
            submitButtonText: json?["submitButtonText"],
        );
    }

}
