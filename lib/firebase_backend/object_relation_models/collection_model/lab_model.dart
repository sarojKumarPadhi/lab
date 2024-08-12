import 'package:cloud_firestore/cloud_firestore.dart';

class LabCollectionModel {
  String? userUid;
  String? phoneNumber;
  int? registrationStep;
  bool? visibleStatus;
  String? deviceToken;
  bool? accountStatus;
  Address? address;
  BankDetails? bankDetails;
  BasicDetails? basicDetails;
  DocumentUrl? documentUrl;
  DocumentVerification? documentVerification;

  LabCollectionModel(
      {this.userUid,
      this.phoneNumber,
      this.registrationStep,
      this.visibleStatus,
      this.deviceToken,
      this.accountStatus,
      this.address,
      this.bankDetails,
      this.basicDetails,
      this.documentUrl,
      this.documentVerification});

  LabCollectionModel.fromJson(Map<String, dynamic> json) {
    userUid = json['userUid'];
    phoneNumber = json['phoneNumber'];
    registrationStep = json['registrationStep'];
    visibleStatus = json['visibleStatus'];
    deviceToken = json['deviceToken'];
    accountStatus = json['accountStatus'];

    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    bankDetails = json['bankDetails'] != null
        ? BankDetails.fromJson(json['bankDetails'])
        : null;
    basicDetails = json['basicDetails'] != null
        ? BasicDetails.fromJson(json['basicDetails'])
        : null;
    documentUrl = json['documentUrl'] != null
        ? DocumentUrl.fromJson(json['documentUrl'])
        : null;
    documentVerification = json['documentVerification'] != null
        ? DocumentVerification.fromJson(json['documentVerification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userUid != null) {
      data['userUid'] = userUid;
    }

    if (phoneNumber != null) {
      data['phoneNumber'] = phoneNumber;
    }
    if (registrationStep != null) {
      data['registrationStep'] = registrationStep;
    }
    if (visibleStatus != null) {
      data['visibleStatus'] = visibleStatus;
    }
    if (deviceToken != null) {
      data['deviceToken'] = deviceToken;
    }
    if (accountStatus != null) {
      data['accountStatus'] = accountStatus;
    }

    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (bankDetails != null) {
      data['bankDetails'] = bankDetails!.toJson();
    }
    if (basicDetails != null) {
      data['basicDetails'] = basicDetails!.toJson();
    }
    if (documentUrl != null) {
      data['documentUrl'] = documentUrl!.toJson();
    }
    if (documentVerification != null) {
      data['documentVerification'] = documentVerification!.toJson();
    }
    return data;
  }
}

class Address {
  String? city;
  String? country;
  DocumentReference<Map<String, dynamic>>? state;
  DocumentReference<Map<String, dynamic>>? district;
  String? pinCode;
  GeoPoint? latLong;

  Address(
      {this.city,
      this.country,
      this.state,
      this.district,
      this.pinCode,
      this.latLong});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    pinCode = json['pinCode'];
    latLong = json['latLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (city != null) {
      data['city'] = city;
    }
    if (country != null) {
      data['country'] = country;
    }
    if (state != null) {
      data['state'] = state;
    }
    if (district != null) {
      data['district'] = district;
    }
    if (pinCode != null) {
      data['pinCode'] = pinCode;
    }
    if (latLong != null) {
      data['latLong'] = latLong;
    }

    return data;
  }
}

class BankDetails {
  String? accountNumber;
  DocumentReference<Map<String, dynamic>>? bankName;
  String? branchName;
  String? ifscCode;

  BankDetails(
      {this.accountNumber, this.bankName, this.branchName, this.ifscCode});

  BankDetails.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    bankName = json['bankName'];
    branchName = json['branchName'];
    ifscCode = json['ifscCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (accountNumber != null) {
      data['accountNumber'] = accountNumber;
    }
    if (bankName != null) {
      data['bankName'] = bankName;
    }
    if (branchName != null) {
      data['branchName'] = branchName;
    }
    if (ifscCode != null) {
      data['ifscCode'] = ifscCode;
    }

    return data;
  }
}

class BasicDetails {
  String? labName;
  String? labOwnerName;
  String? labRegistrationNumber;

  BasicDetails({this.labName, this.labOwnerName, this.labRegistrationNumber});

  BasicDetails.fromJson(Map<String, dynamic> json) {
    labName = json['labName'];
    labOwnerName = json['labOwnerName'];
    labRegistrationNumber = json['labRegistrationNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (labName != null) {
      data['labName'] = labName;
    }
    if (labOwnerName != null) {
      data['labOwnerName'] = labOwnerName;
    }
    if (labRegistrationNumber != null) {
      data['labRegistrationNumber'] = labRegistrationNumber;
    }

    return data;
  }
}

class DocumentUrl {
  String? aadharUrl;
  String? bankPassBookUrl;
  String? panCardUrl;
  String? labCertificateUrl;
  List<String>? labPictureUrl;

  DocumentUrl({
    this.aadharUrl,
    this.bankPassBookUrl,
    this.labCertificateUrl,
    this.labPictureUrl,
    this.panCardUrl,
  });

  DocumentUrl.fromJson(Map<String, dynamic> json) {
    aadharUrl = json['aadharUrl'];
    bankPassBookUrl = json['bankPassBookUrl'];
    labCertificateUrl = json['labCertificateUrl'];
    panCardUrl = json['panCardUrl'];
    labPictureUrl = json['labPictureUrl'];
    if (json['labPictureUrl'] != null &&
        json['labPictureUrl'] is List<String>) {
      labPictureUrl = json['labPictureUrl'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aadharUrl != null) {
      data['aadharUrl'] = aadharUrl;
    }
    if (bankPassBookUrl != null) {
      data['bankPassBookUrl'] = bankPassBookUrl;
    }
    if (labCertificateUrl != null) {
      data['labCertificateUrl'] = labCertificateUrl;
    }
    if (labPictureUrl != null && labPictureUrl!.isNotEmpty) {
      data['labPictureUrl'] = labPictureUrl;
    }

    if (panCardUrl != null) {
      data['panCardUrl'] = panCardUrl;
    }

    return data;
  }
}

class DocumentVerification {
  bool? aadhar;
  bool? bankPassbook;
  bool? labPicture;

  bool? panCard;
  bool? labCertificate;

  DocumentVerification(
      {this.aadhar,
      this.bankPassbook,
      this.labPicture,
      this.panCard,
      this.labCertificate});

  DocumentVerification.fromJson(Map<String, dynamic> json) {
    aadhar = json['aadhar'];
    bankPassbook = json['bankPassbook'];
    labPicture = json['labPicture'];

    panCard = json['panCard'];
    labCertificate = json['labCertificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aadhar != null) {
      data['aadhar'] = aadhar;
    }
    if (bankPassbook != null) {
      data['bankPassbook'] = bankPassbook;
    }
    if (labPicture != null) {
      data['labPicture'] = labPicture;
    }

    if (panCard != null) {
      data['panCard'] = panCard;
    }
    if (labCertificate != null) {
      data['labCertificate'] = labCertificate;
    }

    return data;
  }
}
