import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'background_gallery_image.g.dart'; // This is for the generated adapter code

@HiveType(typeId: HiveTypeId.backgoundImageId) // Assign a unique typeId for this model
class BackgroundGalleryImageId {
  
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? path;

  @HiveField(2)
  final String? compnayId;

  BackgroundGalleryImageId({
    required this.id,
    required this.path,
    required this.compnayId,
  });

  factory BackgroundGalleryImageId.fromJson(Map<String, dynamic> json) {
    return BackgroundGalleryImageId(
      id: json["_id"] ?? "",
      path: json["path"] ?? '',
      compnayId: json["companyId"] ?? '',
    );
  }

  // You can also create a toJson method to easily convert the object to a map
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "path": path,
      "companyId": compnayId,
    };
  }
}
