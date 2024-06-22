

class SurveyLocationModel {
  final String address;
  final String locationId;
  final String locationName;

  SurveyLocationModel({
    required this.address,
    required this.locationId,
    required this.locationName,
  });

  Map<String, dynamic> toJson() {
    return {
      "Address": address,
      "LocationId": locationId,
      "LocationName": locationName,
    };
  }

  factory SurveyLocationModel.fromJson(Map<String, dynamic> json) {
    return SurveyLocationModel(
      address: json['address'] ?? "",
      locationId: json['_id'] ?? "",
      locationName: json['name'] ?? "",
    );
  }

  
}

// extension on SurveyLocationModel{
//   get  surveyLocationEntity => SurveyLocationEntity(
//     address: address,
//     locationId: locationId,
//     locationName: locationName,
//   );
  
// }