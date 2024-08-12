class RegistrationZeroReq {
  String verificationId;
  String phoneNumber;
  String otp;

  RegistrationZeroReq(
      {required this.phoneNumber,
      required this.otp,
      required this.verificationId});

  // RegistrationZeroModel.fromJson(Map<String, dynamic> json) {
  //   phoneNumber = json['phoneNumber'];
  //   otp = json['otp'];
  //   verificationId = json['verificationId'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['phoneNumber'] = phoneNumber;
    data['otp'] = otp;
    data['verificationId'] = verificationId;
    return data;
  }
}
