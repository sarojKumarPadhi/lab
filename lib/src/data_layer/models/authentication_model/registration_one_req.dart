class RegistrationOneReq {
  String? labName;
  String? labOwnerName;
  String? labRegistrationNumber;

  RegistrationOneReq(
      {this.labName, this.labOwnerName, this.labRegistrationNumber});

  RegistrationOneReq.fromJson(Map<String, dynamic> json) {
    labName = json['labName'];
    labOwnerName = json['labOwnerName'];
    labRegistrationNumber = json['labRegistrationNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labName'] = labName;
    data['labOwnerName'] = labOwnerName;
    data['labRegistrationNumber'] = labRegistrationNumber;
    return data;
  }
}
