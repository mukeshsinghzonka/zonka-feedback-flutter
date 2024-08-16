

import 'package:zonka_feedback/feedback/data/data_model_new/background_gallery_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/page_logo_gallery_image.dart';

class LanguagePage {
    LanguagePage({
        required this.applyPageBackgroundImage,
        required this.backgroundGalleryImageId,
        required this.pageBgColor,
        required this.useCustomHeadingColor,
        required this.pageLogoGalleryImageId,
        required this.fontSizeLanguageButton,
        required this.fontColorLanguageButton,
        required this.fontFamilyLanguageButton,
        required this.bgColorLanguageButton,
        required this.fontSizeUpperText,
        required this.fontColorUpperText,
        required this.fontFamilyUpperText,
        required this.fontSizeBottomText,
        required this.fontColorBottomText,
        required this.fontFamilyBottomText,
        required this.showFlagWithLanguage,
        required this.translations,
        required this.id,
    });

    final bool? applyPageBackgroundImage;
    final BackgroundGalleryImageId? backgroundGalleryImageId;
    final String? pageBgColor;
    final bool? useCustomHeadingColor;
    final PageLogoGalleryImageId? pageLogoGalleryImageId;
    final String? fontSizeLanguageButton;
    final String? fontColorLanguageButton;
    final String? fontFamilyLanguageButton;
    final String? bgColorLanguageButton;
    final String? fontSizeUpperText;
    final String? fontColorUpperText;
    final String? fontFamilyUpperText;
    final String? fontSizeBottomText;
    final String? fontColorBottomText;
    final String? fontFamilyBottomText;
    final bool? showFlagWithLanguage;
    final Map<String, LanguagePageTranslation> ? translations;
    final String? id;

    factory LanguagePage.fromJson(Map<String, dynamic>? json){ 
      if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }

        return LanguagePage(
            applyPageBackgroundImage: json["applyPageBackgroundImage"],
            backgroundGalleryImageId: json["backgroundGalleryImageId"]!=null? BackgroundGalleryImageId.fromJson(json["backgroundGalleryImageId"]):json["backgroundGalleryImageId"],
            pageBgColor: json["pageBgColor"],
            useCustomHeadingColor: json["useCustomHeadingColor"],
            pageLogoGalleryImageId:json["pageLogoGalleryImageId"]!=null? PageLogoGalleryImageId.fromJson(json["pageLogoGalleryImageId"]) : json["pageLogoGalleryImageId"],
            fontSizeLanguageButton: json["fontSizeLanguageButton"],
            fontColorLanguageButton: json["fontColorLanguageButton"],
            fontFamilyLanguageButton: json["fontFamilyLanguageButton"],
            bgColorLanguageButton: json["bgColorLanguageButton"],
            fontSizeUpperText: json["fontSizeUpperText"],
            fontColorUpperText: json["fontColorUpperText"],
            fontFamilyUpperText: json["fontFamilyUpperText"],
            fontSizeBottomText: json["fontSizeBottomText"],
            fontColorBottomText: json["fontColorBottomText"],
            fontFamilyBottomText: json["fontFamilyBottomText"],
            showFlagWithLanguage: json["showFlagWithLanguage"],
            translations: json["translations"]==null?null: Map.from(json["translations"]).map((k, v) => MapEntry<String, LanguagePageTranslation>(k, LanguagePageTranslation.fromJson(v))),
            id: json["_id"],
        );
    }

}

class LanguagePageTranslation {
    LanguagePageTranslation({
        required this.upperText,
        required this.bottomText,
    });

    final String? upperText;
    final String? bottomText;

    factory LanguagePageTranslation.fromJson(Map<String, dynamic> json){ 
        return LanguagePageTranslation(
            upperText: json["upperText"],
            bottomText: json["bottomText"],
        );
    }

}