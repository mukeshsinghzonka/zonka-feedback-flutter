import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/background_gallery_image.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/page_logo_gallery_image.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'thankyou_model.g.dart';


@HiveType(typeId: HiveTypeId.typeIdThankYou)
class ThankyouPage extends HiveObject{
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
  
  @HiveField(0)
  final bool? applyPageBackgroundImage;
  @HiveField(1)
  final BackgroundGalleryImageId? backgroundGalleryImageId;
  @HiveField(2)
  final String? pageBgColor;
  @HiveField(3)
  final bool? useCustomHeadingColor;
  @HiveField(4)
  final String? fontColorBottomText;
  @HiveField(5)
  final PageLogoGalleryImageId? pageLogoGalleryImageId;
  @HiveField(6)
  final String? fontColorUpperText;
  @HiveField(7)
  final String? fontSizeUpperText;
  @HiveField(8)
  final String? fontSizeBottomText;
  @HiveField(9)
  final String? fontFamilyUpperText;
  @HiveField(10)
  final String? fontFamilyBottomText;
  @HiveField(11)
  final Map<String, LanguagePageTranslation>? translations;
  @HiveField(12)
  final String? id;

    factory ThankyouPage.fromJson(Map<String, dynamic> ?json){ 
      if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }

        return ThankyouPage(
            applyPageBackgroundImage: json["applyPageBackgroundImage"],
            backgroundGalleryImageId:json["backgroundGalleryImageId"]!=null?  BackgroundGalleryImageId.fromJson(json["backgroundGalleryImageId"]) : null,
            pageBgColor: json["pageBgColor"],
            useCustomHeadingColor: json["useCustomHeadingColor"],
            fontColorBottomText: json["fontColorBottomText"],
            pageLogoGalleryImageId:json["pageLogoGalleryImageId"] != null? PageLogoGalleryImageId.fromJson(json["pageLogoGalleryImageId"]):null,
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


