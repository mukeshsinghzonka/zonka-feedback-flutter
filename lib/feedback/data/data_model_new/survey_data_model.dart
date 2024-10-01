import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/server_name.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';

import '../../../services/hive/hive_type_id.dart';
import 'company_info_model.dart';
import 'logged_in_user.dart';
import 'package:hive/hive.dart';

part 'survey_data_model.g.dart';

@HiveType(typeId: HiveTypeId.surveyDataModel) // Ensure HiveTypeId.surveyDataModel is defined
class SurveyDataModel extends HiveObject {
  @HiveField(0)
  final SurveyModel? surveyModel; // Ensure SurveyModel has its own Hive adapter

  @HiveField(1)
  final dynamic distribution;

  @HiveField(2)
  final dynamic trackingInfo;

  @HiveField(3)
  final CompanyInfoModel? companyInfoModel; // Ensure CompanyInfoModel has its own Hive adapter

  @HiveField(4)
  final String? s3GalleryImageUrl;

  @HiveField(5)
  final LoggedInUser? loggedInUser; // Ensure LoggedInUser has its own Hive adapter

  @HiveField(6)
  List<ServerNameModel>? serveNameModel;

  SurveyDataModel({
    required this.surveyModel,
    required this.distribution,
    required this.companyInfoModel,
    required this.trackingInfo,
    required this.s3GalleryImageUrl,
    required this.loggedInUser,
    required this.serveNameModel
  });

  // From JSON (factory constructor)
  factory SurveyDataModel.fromJson(Map<String, dynamic> json) {
    return SurveyDataModel(
      surveyModel: json['survey'] != null ? SurveyModel.fromJson(json['survey']) : null,
      distribution: json['distribution'],
      trackingInfo: json['trackingInfo'],
      companyInfoModel: json['companyInfoModel'] != null ? CompanyInfoModel.fromJson(json['companyInfoModel']) : null,
      s3GalleryImageUrl: json['s3GalleryImageUrl'],
      loggedInUser: json['loggedInUser'] != null ? LoggedInUser.fromJson(json['loggedInUser']) : null,
      serveNameModel: (json['servers'] as List<dynamic>?) ?.map((item) => ServerNameModel.fromJson(item)).toList(),
    );
  }


}
