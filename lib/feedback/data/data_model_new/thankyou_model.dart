import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';

class ThankyouPage {
    ThankyouPage({
        required this.applyPageBackgroundImage,
        required this.backgroundGalleryImageId,
        required this.pageBgColor,
        required this.useCustomHeadingColor,
        required this.fontColorBottomText,
        required this.pageLogoGalleryImageId,
        required this.fontColorUpperText,
        required this.fontSizeUpperText,
        required this.fontSizeBottomText,
        required this.fontFamilyUpperText,
        required this.fontFamilyBottomText,
        required this.translations,
        required this.id,
    });

    final bool? applyPageBackgroundImage;
    final dynamic backgroundGalleryImageId;
    final String? pageBgColor;
    final bool? useCustomHeadingColor;
    final String? fontColorBottomText;
    final dynamic pageLogoGalleryImageId;
    final String? fontColorUpperText;
    final String? fontSizeUpperText;
    final String? fontSizeBottomText;
    final String? fontFamilyUpperText;
    final String? fontFamilyBottomText;
    final Map<String, LanguagePageTranslation>? translations;
    final String? id;

    factory ThankyouPage.fromJson(Map<String, dynamic> ?json){ 
      if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }

        return ThankyouPage(
            applyPageBackgroundImage: json["applyPageBackgroundImage"],
            backgroundGalleryImageId: json["backgroundGalleryImageId"],
            pageBgColor: json["pageBgColor"],
            useCustomHeadingColor: json["useCustomHeadingColor"],
            fontColorBottomText: json["fontColorBottomText"],
            pageLogoGalleryImageId: json["pageLogoGalleryImageId"],
            fontColorUpperText: json["fontColorUpperText"],
            fontSizeUpperText: json["fontSizeUpperText"],
            fontSizeBottomText: json["fontSizeBottomText"],
            fontFamilyUpperText: json["fontFamilyUpperText"],
            fontFamilyBottomText: json["fontFamilyBottomText"],
            translations:json["translations"]==null?null: Map.from(json["translations"]).map((k, v) => MapEntry<String, LanguagePageTranslation>(k, LanguagePageTranslation.fromJson(v))),
            id: json["_id"],
        );
    }

}


