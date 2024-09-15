import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/background_gallery_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_translation.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/page_logo_gallery_image.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'language_page_model.g.dart'; // Required for Hive type adapter generation


@HiveType(typeId: HiveTypeId.languagePageModelId) // Unique type ID for LanguagePage adapter
class LanguagePage extends HiveObject {
  @HiveField(0)
  final bool? applyPageBackgroundImage;

  @HiveField(1)
  final BackgroundGalleryImageId? backgroundGalleryImageId;

  @HiveField(2)
  final String? pageBgColor;

  @HiveField(3)
  final bool? useCustomHeadingColor;

  @HiveField(4)
  final PageLogoGalleryImageId? pageLogoGalleryImageId;

  @HiveField(5)
  final String? fontSizeLanguageButton;

  @HiveField(6)
  final String? fontColorLanguageButton;

  @HiveField(7)
  final String? fontFamilyLanguageButton;

  @HiveField(8)
  final String? bgColorLanguageButton;

  @HiveField(9)
  final String? fontSizeUpperText;

  @HiveField(10)
  final String? fontColorUpperText;

  @HiveField(11)
  final String? fontFamilyUpperText;

  @HiveField(12)
  final String? fontSizeBottomText;

  @HiveField(13)
  final String? fontColorBottomText;

  @HiveField(14)
  final String? fontFamilyBottomText;

  @HiveField(15)
  final bool? showFlagWithLanguage;

  @HiveField(16)
  final Map<String, LanguagePageTranslation>? translations;

  @HiveField(17)
  final String? id;

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

  factory LanguagePage.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }

    return LanguagePage(
      applyPageBackgroundImage: json["applyPageBackgroundImage"],
      backgroundGalleryImageId: json["backgroundGalleryImageId"] != null
          ? BackgroundGalleryImageId.fromJson(json["backgroundGalleryImageId"])
          : null,
      pageBgColor: json["pageBgColor"],
      useCustomHeadingColor: json["useCustomHeadingColor"],
      pageLogoGalleryImageId: json["pageLogoGalleryImageId"] != null
          ? PageLogoGalleryImageId.fromJson(json["pageLogoGalleryImageId"])
          : null,
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
     translations: json["translations"] == null
    ? null
    : Map<String, LanguagePageTranslation>.from(
        (json["translations"] as Map).map(
          (k, v) => MapEntry(k as String, LanguagePageTranslation.fromJson(v as Map<String, dynamic>)),
        ),
      ),
      id: json["_id"],
    );
  }
}
