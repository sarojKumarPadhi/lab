class UploadDocResp {
  List<String>? url;

  UploadDocResp({this.url});

  UploadDocResp.fromJson(Map<String, dynamic> json) {
    url = json['url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
