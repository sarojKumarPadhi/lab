class RegistrationThreeReq {
  String? accountNumber;
  String? bankId;
  String? branchName;
  String? ifscCode;

  RegistrationThreeReq({
    this.accountNumber,
    this.bankId,
    this.branchName,
    this.ifscCode,
  });

  RegistrationThreeReq.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    bankId = json['bankId'];
    branchName = json['branchName'];
    ifscCode = json['ifscCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['bankId'] = bankId;
    data['branchName'] = branchName;
    data['ifscCode'] = ifscCode;
    return data;
  }
}
