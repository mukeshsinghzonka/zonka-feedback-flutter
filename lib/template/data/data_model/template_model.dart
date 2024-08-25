
import 'package:zonka_feedback/template/data/data_model/surveyId_model.dart';

class TemplateModel {
   final String ? id;
   final List<String>? templateIndustries;
   final List<dynamic>? templateSubIndustries;
   final String? thumbnailImage;
   final List<String>? tags;
   final bool? isPopularTemplate;
   final bool? isActive;
   final String? refCode;
   final DateTime? createdDate;
   final SurveyId? surveyId;

    TemplateModel({
        required this.id,
        required this.templateIndustries,
        required this.templateSubIndustries,
        required this.thumbnailImage,
        required this.tags,
        required this.isPopularTemplate,
        required this.isActive,
        required this.refCode,
        required this.createdDate,
        required this.surveyId,
    });

    factory TemplateModel.fromJson(Map<String, dynamic> json) => TemplateModel(
        id: json["_id"],
        templateIndustries:json["templateIndustries"]!=null? List<String>.from(json["templateIndustries"].map((x) => x)):[],
        templateSubIndustries:json["templateSubIndustries"]!=null? List<dynamic>.from(json["templateSubIndustries"].map((x) => x)):[],
        thumbnailImage: json["thumbnailImage"],
        tags:json["tags"]!=null? List<String>.from(json["tags"].map((x) => x)):[],
        isPopularTemplate: json["isPopularTemplate"],
        isActive: json["isActive"],
        refCode: json["refCode"],
        createdDate:json["createdDate"]!=null? DateTime.parse(json["createdDate"]) : DateTime.now(),
        surveyId: json["surveyId"] ? SurveyId.fromJson(json["surveyId"]):null,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "templateIndustries":templateIndustries!=null? List<dynamic>.from(templateIndustries!.map((x) => x)):[],
        "templateSubIndustries": List<dynamic>.from(templateSubIndustries!.map((x) => x)),
        "thumbnailImage": thumbnailImage,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "isPopularTemplate": isPopularTemplate,
        "isActive": isActive,
        "refCode": refCode,
        "createdDate": createdDate!.toIso8601String(),
        "surveyId": surveyId!.toJson(),
    };
}

