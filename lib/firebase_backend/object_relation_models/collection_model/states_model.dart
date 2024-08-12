class StatesModel {
  String? id;
  String? name;
  String? shortName;

  StatesModel({this.id, this.name, this.shortName});

  StatesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (shortName != null) {
      data['shortName'] = shortName;
    }

    return data;
  }
}
