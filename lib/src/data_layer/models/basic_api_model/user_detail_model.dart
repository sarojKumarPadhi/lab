class UserDetailModel {
  bool? accountStatus;
  String? deviceToken;
  Address? address;
  BankDetails? bankDetails;
  BasicDetails? basicDetails;
  String? phoneNumber;
  DocumentVerification? documentVerification;
  DocumentUrl? documentUrl;
  int? registrationStep;
  String? userUid;

  UserDetailModel(
      {this.phoneNumber,
      this.address,
      this.deviceToken,
      this.bankDetails,
      this.basicDetails,
      this.documentVerification,
      this.documentUrl,
      this.registrationStep,
      this.userUid,
      this.accountStatus});

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
        phoneNumber: json["phoneNumber"],
        address: Address.fromJson(json["address"]),
        deviceToken: json["deviceToken"],
        bankDetails: BankDetails.fromJson(json["bankDetails"]),
        basicDetails: BasicDetails.fromJson(json["basicDetails"]),
        documentVerification:
            DocumentVerification.fromJson(json["documentVerification"]),
        documentUrl: DocumentUrl.fromJson(json["documentUrl"]),
        accountStatus: json["accountStatus"] ?? false,
        userUid: json['userUid'],
        registrationStep: json['registrationStep']);
  }
}

class Address {
  String? country;
  State? state;
  District? district;
  String? city;
  String? pinCode;

  Address({
    this.country,
    this.state,
    this.district,
    this.city,
    this.pinCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        country: json["country"],
        state: json["state"] != null ? State.fromJson(json['state']) : null,
        district: json["district"] != null
            ? District.fromJson(json["district"])
            : null,
        city: json["city"],
        pinCode: json["pinCode"]);
  }
}

class BankDetails {
  String? accountNumber;
  String? ifscCode;
  Bank? bankName;
  String? branchName;

  BankDetails({
    this.accountNumber,
    this.ifscCode,
    this.bankName,
    this.branchName,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return BankDetails(
        accountNumber: json["accountNumber"],
        ifscCode: json["ifscCode"],
        bankName:
            json["bankName"] != null ? Bank.fromJson(json["bankName"]) : null,
        branchName: json["branchName"]);
  }
}

class BasicDetails {
  String? name;
  String? age;
  String? gender;

  BasicDetails({
    this.name,
    this.age,
    this.gender,
  });

  factory BasicDetails.fromJson(Map<String, dynamic> json) {
    return BasicDetails(
      name: json["name"],
      age: json["age"],
      gender: json["gender"],
    );
  }
}

class DocumentVerification {
  bool? aadhar;
  bool? bankPassbook;
  bool? bike;
  bool? educationCertificate;
  bool? panCard;
  bool? selfie;

  DocumentVerification(
      {required this.aadhar,
      required this.bankPassbook,
      required this.bike,
      required this.educationCertificate,
      required this.panCard,
      required this.selfie});

  factory DocumentVerification.fromJson(Map<String, dynamic> json) {
    return DocumentVerification(
        aadhar: json["aadhar"],
        bankPassbook: json["bankPassbook"],
        bike: json["bike"],
        educationCertificate: json["educationCertificate"],
        panCard: json["panCard"],
        selfie: json["selfie"]);
  }
}

class DocumentUrl {
  String? aadharUrl;
  String? bankPassbookUrl;
  String? bikeUrl1;
  String? bikeUrl2;
  String? educationCertificateUrl;
  String? panCardUrl;
  String? selfie1Url;
  String? selfie2Url;

  DocumentUrl({
    this.aadharUrl,
    this.bankPassbookUrl,
    this.bikeUrl1,
    this.bikeUrl2,
    this.educationCertificateUrl,
    this.panCardUrl,
    this.selfie1Url,
    this.selfie2Url,
  });

  factory DocumentUrl.fromJson(Map<String, dynamic> json) {
    return DocumentUrl(
        aadharUrl: json["aadharUrl"],
        bankPassbookUrl: json["bankPassBookUrl"],
        bikeUrl1: json["bike1Url"],
        bikeUrl2: json["bike2Url"],
        educationCertificateUrl: json["educationCertificateUrl"],
        panCardUrl: json["panCardUrl"],
        selfie1Url: json["selfie1Url"],
        selfie2Url: json["selfie2Url"]);
  }
}

class State {
  String? id;
  String? name;
  String? shortName;

  State({this.id, this.name, this.shortName});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (shortName != null) {
      data['shortName'] = shortName;
    }

    return data;
  }
}

class District {
  String? id;
  String? name;
  String? shortName;

  District({this.id, this.name, this.shortName});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;

    data['name'] = name;

    data['shortName'] = shortName;

    return data;
  }
}

class Bank {
  String? id;
  String? name;

  Bank({
    this.id,
    this.name,
  });

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;

    data['name'] = name;

    return data;
  }
}
