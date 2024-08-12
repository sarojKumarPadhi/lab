class StateResp {
  List<StateList>? stateList;

  StateResp({this.stateList});

  StateResp.fromJson(Map<String, dynamic> json) {
    if (json['stateList'] != null) {
      stateList = <StateList>[];
      json['stateList'].forEach((v) {
        stateList!.add(StateList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stateList != null) {
      data['stateList'] = stateList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateList {
  String? name;
  String? shortName;
  String? id;

  StateList({this.name, this.shortName, this.id});

  StateList.fromJson(Map<String, dynamic> json) {
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
