class SurveyBgGalleryImageId {
  final String path;
  final String id;
  final String companyId;

  SurveyBgGalleryImageId({
    required this.path,
    required this.id,
    required this.companyId,
  });


  factory SurveyBgGalleryImageId.fromJson(Map<String, dynamic> ? json) {
    return SurveyBgGalleryImageId(
      path: json?["path"]??"",
      id: json?["_id"]??'',
      companyId: json?["companyId"]??"",
    );
  }
}
