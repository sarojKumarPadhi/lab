class ActiveDriverModel {
  double? latitude;
  double? longitude;

  ActiveDriverModel({this.latitude, this.longitude});

  ActiveDriverModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (latitude != null && longitude != null) {
      data['latitude'] = latitude;
      data['longitude'] = longitude;
    }

    return data;
  }
}
