class RegistrationFourReq {
  String? aadharUrl;
  String? bankPassBookUrl;
  String? labCertificateUrl;
  String? panCardUrl;

  RegistrationFourReq(
      {this.aadharUrl,
      this.bankPassBookUrl,
      this.labCertificateUrl,
      this.panCardUrl});

  RegistrationFourReq.fromJson(Map<String, dynamic> json) {
    aadharUrl = json['aadharUrl'];
    bankPassBookUrl = json['bankPassBookUrl'];
    labCertificateUrl = json['labCertificateUrl'];
    panCardUrl = json['panCardUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aadharUrl'] = aadharUrl;
    data['bankPassBookUrl'] = bankPassBookUrl;
    data['labCertificateUrl'] = labCertificateUrl;
    data['panCardUrl'] = panCardUrl;
    return data;
  }
}
