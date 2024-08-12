class RegistrationTwoReq {
  String? city;
  String? country;
  String? district;
  String? pinCode;
  String? state;
  double? latitude;
  double? longitude;

  RegistrationTwoReq(
      {this.city,
      this.country,
      this.district,
      this.pinCode,
      this.state,
      this.latitude,
      this.longitude});

  RegistrationTwoReq.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    district = json['district'];
    pinCode = json['pinCode'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['country'] = country;
    data['district'] = district;
    data['pinCode'] = pinCode;
    data['state'] = state;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
