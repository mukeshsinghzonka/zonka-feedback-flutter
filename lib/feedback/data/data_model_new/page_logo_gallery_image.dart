import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'page_logo_gallery_image.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: HiveTypeId.pageLogoGalleryImageId)// Unique ID for PageLogoGalleryImageId adapter
class PageLogoGalleryImageId extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? path;

  @HiveField(2)
  final String? compnayId;

  PageLogoGalleryImageId({
    required this.id,
    required this.path,
    required this.compnayId,
  });

  factory PageLogoGalleryImageId.fromJson(Map<String, dynamic> json) {
    return PageLogoGalleryImageId(
      id: json["_id"] ?? "",
      path: json["path"] ?? '',
      compnayId: json["companyId"] ?? '',
    );
  }
}
