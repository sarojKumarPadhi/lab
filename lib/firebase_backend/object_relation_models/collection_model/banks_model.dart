class BanksModel {
  String? id;
  String? name;

  BanksModel({
    this.id,
    this.name,
  });

  BanksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }

    return data;
  }
}
