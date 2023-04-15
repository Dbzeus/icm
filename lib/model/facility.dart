/// RtnStatus : true
/// RtnMessage : "Detail list Loaded successfully"
/// RtnData : [{"EmployeeID":1,"LocationID":29,"LocationName":"ICM Location","BuildingID":1,"BuildingName":"Block1","TenantID":1,"TenantName":"Tenant1","LogoPath":"https://dbzrental.dbzapps.com/UploadImages/Tenant/b336a483-8e3c-465c-a095-dcdf48dae95e.jpg","MeterID":1,"FacilityID":1,"FaciltyImage":"https://dbzrental.dbzapps.com/UploadImages/FaciltyImage/EBMeter.png","FacilityName":"Electricity","MeterName":"EBMtr1","OpeningReading":230,"ClosingReading":0,"RunningReading":0,"UnitName":"Watt","LastReadingDate":"12-04-2023 01:18","Completed":false,"TotalReading":0}]
/// OtherMsg : null
/// ID : 0

class Facility {
  Facility(
    this.rtnStatus,
    this.rtnMessage,
    this.rtnData,

  );

  Facility.fromJson(dynamic json) {
    rtnStatus = json['RtnStatus'];
    rtnMessage = json['RtnMessage'];
    if (json['RtnData'] != null) {
      rtnData = [];
      json['RtnData'].forEach((v) {
        rtnData.add(FacilityData.fromJson(v));
      });
    }
  }

  late bool rtnStatus;
  late String rtnMessage;
  late List<FacilityData> rtnData;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['RtnStatus'] = rtnStatus;
    map['RtnMessage'] = rtnMessage;
    map['RtnData'] = rtnData.map((v) => v.toJson()).toList();
    return map;
  }
}

/// EmployeeID : 1
/// LocationID : 29
/// LocationName : "ICM Location"
/// BuildingID : 1
/// BuildingName : "Block1"
/// TenantID : 1
/// TenantName : "Tenant1"
/// LogoPath : "https://dbzrental.dbzapps.com/UploadImages/Tenant/b336a483-8e3c-465c-a095-dcdf48dae95e.jpg"
/// MeterID : 1
/// FacilityID : 1
/// FaciltyImage : "https://dbzrental.dbzapps.com/UploadImages/FaciltyImage/EBMeter.png"
/// FacilityName : "Electricity"
/// MeterName : "EBMtr1"
/// OpeningReading : 230
/// ClosingReading : 0
/// RunningReading : 0
/// UnitName : "Watt"
/// LastReadingDate : "12-04-2023 01:18"
/// Completed : false
/// TotalReading : 0

class FacilityData {
  FacilityData(
    this.employeeID,
    this.locationID,
    this.locationName,
    this.buildingID,
    this.buildingName,
    this.tenantID,
    this.tenantName,
    this.logoPath,
    this.meterID,
    this.facilityID,
    this.faciltyImage,
    this.facilityName,
    this.meterName,
    this.openingReading,
    this.closingReading,
    this.runningReading,
    this.unitName,
    this.lastReadingDate,
    this.completed,
    this.totalReading,
  );

  FacilityData.fromJson(dynamic json) {
    employeeID = json['EmployeeID'];
    locationID = json['LocationID'];
    locationName = json['LocationName'];
    buildingID = json['BuildingID'];
    buildingName = json['BuildingName'];
    tenantID = json['TenantID'];
    tenantName = json['TenantName'];
    logoPath = json['LogoPath'];
    meterID = json['MeterID'];
    facilityID = json['FacilityID'];
    faciltyImage = json['FaciltyImage'];
    facilityName = json['FacilityName'];
    meterName = json['MeterName'];
    openingReading = json['OpeningReading'];
    closingReading = json['ClosingReading'];
    runningReading = json['RunningReading'];
    unitName = json['UnitName'];
    lastReadingDate = json['LastReadingDate'];
    completed = json['Completed'];
    totalReading = json['TotalReading'];
  }

  late int employeeID;
  late int locationID;
  late String locationName;
  late int buildingID;
  late String buildingName;
  late int tenantID;
  late String tenantName;
  late String logoPath;
  late int meterID;
  late int facilityID;
  late String faciltyImage;
  late String facilityName;
  late String meterName;
  late double openingReading;
  late double closingReading;
  late double runningReading;
  late String unitName;
  late String lastReadingDate;
  late bool completed;
  late double totalReading;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EmployeeID'] = employeeID;
    map['LocationID'] = locationID;
    map['LocationName'] = locationName;
    map['BuildingID'] = buildingID;
    map['BuildingName'] = buildingName;
    map['TenantID'] = tenantID;
    map['TenantName'] = tenantName;
    map['LogoPath'] = logoPath;
    map['MeterID'] = meterID;
    map['FacilityID'] = facilityID;
    map['FaciltyImage'] = faciltyImage;
    map['FacilityName'] = facilityName;
    map['MeterName'] = meterName;
    map['OpeningReading'] = openingReading;
    map['ClosingReading'] = closingReading;
    map['RunningReading'] = runningReading;
    map['UnitName'] = unitName;
    map['LastReadingDate'] = lastReadingDate;
    map['Completed'] = completed;
    map['TotalReading'] = totalReading;
    return map;
  }
}
