class HeadingImage {
    final String path;
    final String id;
    final String companyId;

    HeadingImage({
        required this.path,
        required this.id,
        required this.companyId,
    });

    factory HeadingImage.fromJson(Map<String, dynamic> ?json) {
        if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }
        return HeadingImage(  
  path: json["path"] ?? "",
      id: json["_id"] ?? '',
      companyId: json["companyId"] ?? "",
        );
    }
}