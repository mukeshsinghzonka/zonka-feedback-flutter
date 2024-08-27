class TemplateIndustriesMap {
    final String ? id;
    final String ?name;
    final String ?description;
    final List<dynamic> ?subCategories;
    final bool ?showInWeb;
    final bool ?showInApp;
    final String? type;
    final String ?icon;
    final String ?heading;
    final String ?subHeading;

    TemplateIndustriesMap({
        required this.id,
        required this.name,
        required this.description,
        required this.subCategories,
        required this.showInWeb,
        required this.showInApp,
        required this.type,
        required this.icon,
        required this.heading,
        required this.subHeading,
    });

    factory TemplateIndustriesMap.fromJson(Map<String, dynamic> json) => TemplateIndustriesMap(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        subCategories: List<dynamic>.from(json["subCategories"].map((x) => x)),
        showInWeb: json["showInWeb"],
        showInApp: json["showInApp"],
        type: json["type"],
        icon: json["icon"],
        heading: json["heading"],
        subHeading: json["subHeading"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "subCategories": List<dynamic>.from(subCategories!.map((x) => x)),
        "showInWeb": showInWeb,
        "showInApp": showInApp,
        "type": type,
        "icon": icon,
        "heading": heading,
        "subHeading": subHeading,
    };
}