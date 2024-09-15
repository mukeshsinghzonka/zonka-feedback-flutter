// OptionGalleryImageId Model
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'option_gallery_image.g.dart';

@HiveType(typeId: HiveTypeId.optionGalleryImageId)
class OptionGalleryImageId extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final String companyId;

   OptionGalleryImageId({
    required this.path,
    required this.id,
    required this.companyId,
  });

  factory OptionGalleryImageId.fromJson(Map<String, dynamic> json) {
    return OptionGalleryImageId(
      path: json["path"],
      id: json["_id"],
      companyId: json["companyId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"path": path, "id": id, "companyId": companyId};
  }

  @override
  List<Object?> get props => [path, id, companyId];
}
