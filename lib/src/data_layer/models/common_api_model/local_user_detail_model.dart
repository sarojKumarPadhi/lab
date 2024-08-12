class LocalUserDetailModel {
  String? mobile;
  String? userUid;
  String? deviceToken;
  int? registrationStep;
  bool? accountStatus;
  LocalUserDetailModel(
      {this.mobile,
      this.userUid,
      this.deviceToken,
      this.registrationStep,
      required this.accountStatus});

  LocalUserDetailModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    userUid = json['userUid'];
    deviceToken = json['deviceToken'];
    registrationStep = json['registrationStep'];
    accountStatus = json['accountStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mobile != null) {
      data['mobile'] = mobile;
    }
    data['userUid'] = userUid;
    data['deviceToken'] = deviceToken;
    data['registrationStep'] = registrationStep;
    data['accountStatus'] = accountStatus;
    return data;
  }
}
