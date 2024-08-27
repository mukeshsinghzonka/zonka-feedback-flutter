
class SurveyId {
   final String? id;
   final String? name;
   final String? type;
   final String? description;
   final int? preMongifiedId;
   final String? viewMode;
   final String? mode;

    SurveyId({
        required this.id,
        required this.name,
        required this.type,
        required this.description,
        required this.preMongifiedId,
        required this.viewMode,
        required this.mode,
    });

    factory SurveyId.fromJson(Map<String, dynamic> json) => SurveyId(
        id: json["_id"]??'',
        name: json["name"]??'',
        type: json["type"]??'',
        description: json["description"]??'',
        preMongifiedId: json["pre_mongified_id"]??0,
        viewMode: json["viewMode"]??'',
        mode: json["mode"]??"",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "description": description,
        "pre_mongified_id": preMongifiedId,
        "viewMode": viewMode,
        "mode": mode,
    };
}