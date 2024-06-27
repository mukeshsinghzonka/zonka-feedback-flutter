

class Logic {
    Logic({
        required this.actionTaken,
        required this.skipToScreenOrQuestion,
        required this.showQuestionList,
        required this.hideQuestionList,
        required this.redirectUrl,
        required this.skipHideRedirectTo,
        // required this.locationBasedUrls,
        // required this.languageBasedUrls,
    });

    final String? actionTaken;
    final String? skipToScreenOrQuestion;
    final String? showQuestionList;
    final String? hideQuestionList;
    final String? redirectUrl;
    final String? skipHideRedirectTo;
    // final List<dynamic> locationBasedUrls;
    // final List<dynamic> languageBasedUrls;

    factory Logic.fromJson(Map<String, dynamic> json){ 
        return Logic(
            actionTaken: json["actionTaken"],
            skipToScreenOrQuestion: json["skipToScreenOrQuestion"],
            showQuestionList: json["showQuestionList"],
            hideQuestionList: json["hideQuestionList"],
            redirectUrl: json["redirectUrl"],
            skipHideRedirectTo: json["skipHideRedirectTo"],
            // locationBasedUrls: json["locationBasedUrls"] == null ? [] : List<dynamic>.from(json["locationBasedUrls"]!.map((x) => x)),
            // languageBasedUrls: json["languageBasedUrls"] == null ? [] : List<dynamic>.from(json["languageBasedUrls"]!.map((x) => x)),
        );
    }

}
