class BankResp {
  List<BankList>? bankList;

  BankResp({this.bankList});

  BankResp.fromJson(Map<String, dynamic> json) {
    if (json['bankList'] != null) {
      bankList = <BankList>[];
      json['bankList'].forEach((v) {
        bankList!.add(BankList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bankList != null) {
      data['bankList'] = bankList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankList {
  String? id;
  String? name;

  BankList({this.id, this.name});

  BankList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
