class BasicMetaData {
    final String ?  surveyId;
    final String ? companyId;
    final String ? domain;
    final String ? url;
    final String ? queryString ;
    final String ? userAgent;
    final bool?  cookie;
    final String ? pageName;
    final String ? ipAddress;
    final String ? resolution;
    final int ?timeZone;
    final String ? refferUrl;
    final String ? embed;
    final String ? surveyRefCode;
    final String ? trackRefCode;
    final String ? contactId;
    final String ? cookieId;
    final String ? externalVisitorId;
    final String ? browserLanguage;
    final String ? device;
    final String ? deviceOs;
    final String ? deviceOsVersion;
    final String ? deviceSerialNumber;
    final String ? deviceName;
    final String ? deviceModel;
    final String ? deviceBrand;
    final String ? socketConnId;

    BasicMetaData({
         this.surveyId,
         this.companyId,
         this.domain,
         this.url,
         this.queryString ,
         this.userAgent,
         this.cookie,
         this.pageName,
         this.ipAddress,
         this.resolution,
         this.timeZone,
         this.refferUrl,
         this.embed,
         this.surveyRefCode,
         this.trackRefCode,
         this.contactId,
         this.cookieId,
         this.externalVisitorId,
         this.browserLanguage,
         this.device,
         this.deviceOs,
         this.deviceOsVersion,
         this.deviceSerialNumber,
         this.deviceName,
         this.deviceModel,
         this.deviceBrand,
         this.socketConnId,
    });


 Map<String ?, dynamic> toJsonBasicMeta() {
    return {
      'surveyId': surveyId,
      'companyId': companyId,
      'domain': domain,
      'url': url,
      'queryString ?': queryString ,
      'userAgent': userAgent,
      'cookie': cookie,
      'pageName': pageName,
      'ipAddress': ipAddress,
      'resolution': resolution,
      'timeZone': timeZone,
      'refferUrl': refferUrl,
      'embed': embed,
      'surveyRefCode': surveyRefCode,
      'trackRefCode': trackRefCode,
      'contactId': contactId,
      'cookieId': cookieId,
      'externalVisitorId': externalVisitorId,
      'browserLanguage': browserLanguage,
      'device': device,
      'deviceOs': deviceOs,
      'deviceOsVersion': deviceOsVersion,
      'deviceSerialNumber': deviceSerialNumber,
      'deviceName': deviceName,
      'deviceModel': deviceModel,
      'deviceBrand': deviceBrand,
      'socketConnId': socketConnId,
    };
 }
    

}