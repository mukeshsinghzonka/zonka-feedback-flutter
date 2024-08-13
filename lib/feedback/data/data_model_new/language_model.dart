

class LanguageModel {
    final String? id;
    final int ? preMongifiedId;
    final String?  languageName;
    final String? languageCode;
    final String ?languageLocalName;
    final DateTime? createdDate;
    final String ?shortCode;
    final String ? imageUrlAsset;
    LanguageModel({
        required this.id,
        required this.preMongifiedId,
        required this.languageName,
        required this.languageCode,
        required this.languageLocalName,
        required this.createdDate,
        required this.shortCode,
        required this.imageUrlAsset
    });


factory LanguageModel.fromJson(Map<String, dynamic> json){

  return LanguageModel(
    id: json['_id'],
    preMongifiedId: json['pre_mongified_id'], 
    languageName: json['languageName'],
    languageCode: json['languageCode'], 
    languageLocalName: json['languageLocalName'], 
    createdDate:json['createdDate']!=null?  DateTime.parse( json['createdDate']):null, 
    shortCode: json['shortCode'],
    imageUrlAsset: "assests/large_flags/${json['languageCode'].toString().split('_')[1].toUpperCase()}.png"
    );
}
}