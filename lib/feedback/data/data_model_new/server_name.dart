

import 'package:hive/hive.dart';

import '../../../services/hive/hive_type_id.dart';

part 'server_name.g.dart';

@HiveType(typeId: HiveTypeId.serverNameModel) // Define a unique Hive type ID
class ServerNameModel extends HiveObject {
  @HiveField(0)
  final String? pin;

  @HiveField(1)
  final String? userId;

  @HiveField(2)
  final String? serverName;

  ServerNameModel({
    required this.pin,
    required this.userId,
    required this.serverName,
  });

  // From JSON (factory constructor)
  factory ServerNameModel.fromJson(Map<String, dynamic> json) {
    return ServerNameModel(
      pin: json['Pin'],
      userId: json['userId'],
      serverName: json['ServerName'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'userId': userId,
      'serverName': serverName,
    };
  }
}
