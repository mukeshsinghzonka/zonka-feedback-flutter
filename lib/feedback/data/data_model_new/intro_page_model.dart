

class IntroPage {
    IntroPage({
        required this.applyPageBackgroundImage,
        required this.backgroundGalleryImageId,
        required this.pageBgColor,
        required this.useCustomHeadingColor,
        required this.pageLogoGalleryImageId,
        required this.fontSizeGetStartButton,
        required this.fontColorGetStartButton,
        required this.fontFamilyGetStartButton,
        required this.bgColorGetStartButton,
        required this.buttonStyle,
        required this.fontSizeUpperText,
        required this.fontColorUpperText,
        required this.fontFamilyUpperText,
        required this.fontSizeBottomText,
        required this.fontColorBottomText,
        required this.fontFamilyBottomText,
        required this.translations,
        required this.id,
    });

    final bool? applyPageBackgroundImage;
    final dynamic backgroundGalleryImageId;
    final String? pageBgColor;
    final bool? useCustomHeadingColor;
    final dynamic pageLogoGalleryImageId;
    final String? fontSizeGetStartButton;
    final String? fontColorGetStartButton;
    final String? fontFamilyGetStartButton;
    final String? bgColorGetStartButton;
    final String? buttonStyle;
    final String? fontSizeUpperText;
    final String? fontColorUpperText;
    final String? fontFamilyUpperText;
    final String? fontSizeBottomText;
    final String? fontColorBottomText;
    final String? fontFamilyBottomText;
    final Map<String, IntroPageTranslation> ?translations;
    final String? id;

    factory IntroPage.fromJson(Map<String, dynamic> json){ 
        return IntroPage(
            applyPageBackgroundImage: json["applyPageBackgroundImage"],
            backgroundGalleryImageId: json["backgroundGalleryImageId"],
            pageBgColor: json["pageBgColor"],
            useCustomHeadingColor: json["useCustomHeadingColor"],
            pageLogoGalleryImageId: json["pageLogoGalleryImageId"],
            fontSizeGetStartButton: json["fontSizeGetStartButton"],
            fontColorGetStartButton: json["fontColorGetStartButton"],
            fontFamilyGetStartButton: json["fontFamilyGetStartButton"],
            bgColorGetStartButton: json["bgColorGetStartButton"],
            buttonStyle: json["buttonStyle"],
            fontSizeUpperText: json["fontSizeUpperText"],
            fontColorUpperText: json["fontColorUpperText"],
            fontFamilyUpperText: json["fontFamilyUpperText"],
            fontSizeBottomText: json["fontSizeBottomText"],
            fontColorBottomText: json["fontColorBottomText"],
            fontFamilyBottomText: json["fontFamilyBottomText"],
            translations:json["translations"]==null?null: Map.from(json["translations"]).map((k, v) => MapEntry<String, IntroPageTranslation>(k, IntroPageTranslation.fromJson(v))),
            id: json["_id"],
        );
    }

}


class IntroPageTranslation {
    IntroPageTranslation({
        required this.getStarted,
        required this.upperText,
        required this.bottomText,
    });

    final String? getStarted;
    final String? upperText;
    final String? bottomText;

    factory IntroPageTranslation.fromJson(Map<String, dynamic> json){ 
        return IntroPageTranslation(
            getStarted: json["getStarted"],
            upperText: json["upperText"],
            bottomText: json["bottomText"],
        );
    }

}