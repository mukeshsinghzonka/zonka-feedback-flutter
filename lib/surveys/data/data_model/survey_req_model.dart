class SurveyReqModel {
  final int branchId;
  final String branchMongoId;
  final String branchName;
  final String bgImage;
  final String brandId;
  final int companyId;
  final String companyName;
  SurveyReqModel({
    required this.branchId,
    required this.branchMongoId,
    required this.branchName,
    required this.bgImage,
    required this.brandId,
    required this.companyId,
    required this.companyName,
  });

  Map<String, dynamic> toJson() {
    return {
      "BranchId": branchId,
      "BranchMongoId": branchMongoId,
      "BranchName": branchName,
      "BgImage": bgImage,
      "BrandId": brandId,
      "BrandTitle": "Brand Name",
      "IsDefaultBranch": "0",
      "CompanyId": companyId,
      "CompanyName": companyName,
    };
  }

}