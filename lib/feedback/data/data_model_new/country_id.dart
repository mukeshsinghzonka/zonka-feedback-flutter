
import 'package:hive/hive.dart';

import '../../../services/hive/hive_type_id.dart';

part 'country_id.g.dart';

@HiveType(typeId: HiveTypeId.countryIdModel)
class CountryId extends HiveObject{
  @HiveField(0)
  final String? phoneCode;
  @HiveField(1)
  final String? id;

  CountryId({
    required this.phoneCode,
    required this.id,
  });

  // From JSON (factory constructor)
  factory CountryId.fromJson(Map<String, dynamic> json) {
    return CountryId(
      phoneCode: json['phoneCode'],
      id: json['id'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'phoneCode': phoneCode,
      'id': id,
    };
  }
}
