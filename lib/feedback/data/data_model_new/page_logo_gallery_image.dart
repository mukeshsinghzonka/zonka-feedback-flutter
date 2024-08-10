class PageLogoGalleryImageId{

  final String? id;
  final String? path;
  final String? compnayId;

  PageLogoGalleryImageId({
    required this.id,
    required this.path,
    required this.compnayId,
  });

  factory PageLogoGalleryImageId.fromJson(Map<String, dynamic> json) {
    return PageLogoGalleryImageId(
      id: json["_id"]??"",
      path: json["path"]??'',
      compnayId: json["companyId"]??'',
    );
  }
}