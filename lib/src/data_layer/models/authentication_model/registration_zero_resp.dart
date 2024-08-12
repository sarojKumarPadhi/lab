class RegistrationZeroResp {
  int? registrationStep;
  bool? accountStatus;
  String? phoneNumber;
  String? userUid;
  String? deviceToken;

  RegistrationZeroResp(
      {this.registrationStep,
      this.accountStatus,
      this.phoneNumber,
      this.userUid,
      this.deviceToken});

  RegistrationZeroResp.fromJson(Map<String, dynamic> json) {
    registrationStep = json['registrationStep'];
    accountStatus = json['accountStatus'];
    phoneNumber = json['phoneNumber'];
    userUid = json['userUid'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['registrationStep'] = registrationStep;
    data['accountStatus'] = accountStatus;
    data['phoneNumber'] = phoneNumber;
    data['userUid'] = userUid;
    data['deviceToken'] = deviceToken;
    return data;
  }
}
