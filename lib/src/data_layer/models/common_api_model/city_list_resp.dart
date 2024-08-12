class CityResp {
  List<CityList>? cityList;

  CityResp({this.cityList});

  CityResp.fromJson(Map<String, dynamic> json) {
    if (json['cityList'] != null) {
      cityList = <CityList>[];
      json['cityList'].forEach((v) {
        cityList!.add(CityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cityList != null) {
      data['cityList'] = cityList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityList {
  String? name;
  String? shortName;
  String? id;

  CityList({this.name, this.shortName, this.id});

  CityList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['shortName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['shortName'] = shortName;
    data['id'] = id;
    return data;
  }
}
