

import 'package:hive/hive.dart';

import '../../../services/hive/hive_type_id.dart';

part 'time_zone.g.dart';


@HiveType(typeId: HiveTypeId.timeZoneModel)
class TimeZoneId  extends HiveObject {
  @HiveField(0)
  final String timeZone;
  @HiveField(1)
  final String tzOffset;
  @HiveField(2)
  final String id;

  TimeZoneId({
    required this.timeZone,
    required this.tzOffset,
    required this.id,
  });

  // From JSON (factory constructor)
  factory TimeZoneId.fromJson(Map<String, dynamic> json) {
    return TimeZoneId(
      timeZone: json['timeZone'],
      tzOffset: json['tzOffset'],
      id: json['id'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'timeZone': timeZone,
      'tzOffset': tzOffset,
      'id': id,
    };
  }
}