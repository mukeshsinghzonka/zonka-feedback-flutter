class LocationModel {

  final List<String> tags;
  final String id;
  final String name;
  final int preMongifiedId;
  final String groupId;
 final String posterImage;
  LocationModel({
    required this.tags,
    required this.id,
    required this.name,
    required this.preMongifiedId,
    required this.groupId,
    required this.posterImage,
  });


  

  factory LocationModel.fromMap(Map<String, dynamic> json) {
    return LocationModel(
      tags: List<String>.from(json['tags']),
      id: json['_id'],
      name: json['name'],
      preMongifiedId: json['pre_mongified_id'],
      groupId: json['groupid']??"",
      posterImage: json['posterImage']??"",
    );
  }

  toSurveyReqModel() {}
}
