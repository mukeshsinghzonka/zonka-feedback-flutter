import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/time_zone.dart';

import '../../../services/hive/hive_type_id.dart';
import 'country_id.dart';

part 'company_info_model.g.dart';

@HiveType(typeId: HiveTypeId.companyInfoModel) // Ensure HiveTypeId.companyInfoModel is defined in your code
class CompanyInfoModel extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? emailSurverySenderName;

  @HiveField(2)
  final String? emailSurveyEmailAddress;

  @HiveField(3)
  final bool? emailSurveyVerified;

  @HiveField(4)
  final String? sitename;

  @HiveField(5)
  final String? region;

  @HiveField(6)
  final CountryId? countryId; // Ensure CountryId has its own Hive adapter

  @HiveField(7)
  final TimeZoneId? timeZoneId; // Ensure TimeZoneId has its own Hive adapter

  @HiveField(8)
  final bool? locationModuleStatus;

  @HiveField(9)
  final bool? isActive;

  @HiveField(10)
  final bool? isDeleted;

  @HiveField(11)
  final String? id;

  @HiveField(12)
  final String? logo;

  CompanyInfoModel({
    required this.name,
    required this.emailSurverySenderName,
    required this.emailSurveyEmailAddress,
    required this.emailSurveyVerified,
    required this.sitename,
    required this.region,
    required this.countryId,
    required this.timeZoneId,
    required this.locationModuleStatus,
    required this.isActive,
    required this.isDeleted,
    required this.id,
    required this.logo,
  });

  // From JSON (factory constructor)
  factory CompanyInfoModel.fromJson(Map<String, dynamic> json) {
    return CompanyInfoModel(
      name: json['name'],
      emailSurverySenderName: json['emailSurverySenderName'],
      emailSurveyEmailAddress: json['emailSurveyEmailAddress'],
      emailSurveyVerified: json['emailSurveyVerified'],
      sitename: json['sitename'],
      region: json['region'],
      countryId: CountryId.fromJson(json['countryId']),
      timeZoneId: TimeZoneId.fromJson(json['timeZoneId']),
      locationModuleStatus: json['locationModuleStatus'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      id: json['id'],
      logo: json['logo'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'emailSurverySenderName': emailSurverySenderName,
      'emailSurveyEmailAddress': emailSurveyEmailAddress,
      'emailSurveyVerified': emailSurveyVerified,
      'sitename': sitename,
      'region': region,
      'countryId': countryId?.toJson(),
      'timeZoneId': timeZoneId?.toJson(),
      'locationModuleStatus': locationModuleStatus,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'id': id,
      'logo': logo,
    };
  }
}
