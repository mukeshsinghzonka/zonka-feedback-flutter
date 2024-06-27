

class Option {
    Option({
        required this.optionNodeId,
        required this.id,
        required this.translations,
        required this.preMongifiedId,
    });

    final String? optionNodeId;
    final String? id;
    final Map<String, OptionTranslation> ?translations;
    final int? preMongifiedId;

    factory Option.fromJson(Map<String, dynamic> json){ 
        return Option(
            optionNodeId: json["optionNodeId"],
            id: json["_id"],
            translations: json["translations"] ==null?null:Map.from(json["translations"]).map((k, v) => MapEntry<String, OptionTranslation>(k, OptionTranslation.fromJson(v))),
            preMongifiedId: json["pre_mongified_id"],
        );
    }

}

class OptionTranslation {
    OptionTranslation({
        required this.name,
    });

    final String? name;

    factory OptionTranslation.fromJson(Map<String, dynamic> json){ 
        return OptionTranslation(
            name: json["name"],
        );
    }

}