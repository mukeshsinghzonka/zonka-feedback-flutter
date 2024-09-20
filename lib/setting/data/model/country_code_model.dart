class CountryCodeModel{

final String countryName;
final String dialCode;
final String code;

CountryCodeModel({
  required this.code,
  required this.dialCode,
  required this.countryName
});


 factory CountryCodeModel.fromMap(Map<String, dynamic> json){
  return CountryCodeModel(code: json['code'], 
  dialCode: json['dial_code'],
   countryName: json['name']);
}

}