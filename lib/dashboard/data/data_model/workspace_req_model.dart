class  WorkspaceReqModel {
  final String branchId;
  final String branchMongoId;
  final String branchName;
  final String bgImage;
  final String brandId;
  final String brandTitle;
  final String companyId;
  final String compnayName;
  WorkspaceReqModel({
    required this.branchId,
    required this.branchMongoId,
    required this.branchName,
    required this.bgImage,
    required this.brandId,
    required this.brandTitle,
    required this.companyId,
    required this.compnayName,
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
      "CompanyName": compnayName,
    };
  }

}