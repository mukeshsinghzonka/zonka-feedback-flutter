
import 'package:zonka_feedback/template/data/data_model/logged_in_user.dart';

class AddTemplateModel {
  final String ?id;
  final int ?preMongifiedId;
  final String ?name;
  final String ?uniqueRefCode;
  final String ?workSpaceId;
  final LoggedinUser? loggedinUser;

  AddTemplateModel({
    required this.id,
    required this.preMongifiedId,
    required this.name,
    required this.uniqueRefCode,
    required this.workSpaceId,
    required this.loggedinUser,
  });

  factory AddTemplateModel.fromJson(Map<String, dynamic> json) =>
      AddTemplateModel(
          id: json['_id'],
          preMongifiedId: json["pre_mongified_id"],
          name: json['name'],
          uniqueRefCode: json['uniqueRefCode'],
          workSpaceId: json['workSpaceId'],
          loggedinUser: json['loggedinUser'] != null
              ? LoggedinUser.fromJson(json['loggedinUser'])
              : null);
}
