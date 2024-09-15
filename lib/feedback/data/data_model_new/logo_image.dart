import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'logo_image.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: HiveTypeId.logoImageId)// Unique type ID for LogoGalleryImageId adapter
class LogoGalleryImageId extends HiveObject {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final String companyId;

  LogoGalleryImageId({
    required this.path,
    required this.id,
    required this.companyId,
  });

  factory LogoGalleryImageId.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }

    return LogoGalleryImageId(
      path: json["path"] ?? "",
      id: json["_id"] ?? '',
      companyId: json["companyId"] ?? "",
    );
  }
}
