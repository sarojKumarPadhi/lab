class RegistrationFiveReq {
  List<String>? labPictureUrl;

  RegistrationFiveReq({this.labPictureUrl});

  RegistrationFiveReq.fromJson(Map<String, dynamic> json) {
    labPictureUrl = json['labPictureUrl'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labPictureUrl'] = labPictureUrl;
    return data;
  }
}
