import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';
part 'location_model.g.dart';

@HiveType(typeId: 1) // Assign a unique typeId for this class
class LocationModel extends HiveObject with EquatableMixin {

  @HiveField(0)
  final List<String> tags;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int preMongifiedId;
  @HiveField(4)
  final String groupId;
  @HiveField(5)
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
      groupId: json['groupid'] ?? "",
      posterImage: json['posterImage'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
    tags,
    id,
    name,
    preMongifiedId,
    groupId,
    posterImage,
  ];
}
