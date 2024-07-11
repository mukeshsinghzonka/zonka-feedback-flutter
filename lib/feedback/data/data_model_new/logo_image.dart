class LogoGalleryImageId {
  final String path;
  final String id;
  final String companyId;

  LogoGalleryImageId({
    required this.path,
    required this.id,
    required this.companyId,
  });

  factory LogoGalleryImageId.fromJson(Map<String, dynamic> json) {
    return LogoGalleryImageId(
      path: json["path"] ?? "",
      id: json["_id"] ?? '',
      companyId: json["companyId"] ?? "",
    );
  }
}
