

class BackgroundGalleryImageId{
  
  final String? id;
  final String? path;
  final String? compnayId;

  BackgroundGalleryImageId({
    required this.id,
    required this.path,
    required this.compnayId,
  });

  factory BackgroundGalleryImageId.fromJson(Map<String, dynamic> json) {
    return BackgroundGalleryImageId(
      id: json["_id"]??"",
      path: json["path"]??'',
      compnayId: json["companyId"]??'',
    );
  }
}