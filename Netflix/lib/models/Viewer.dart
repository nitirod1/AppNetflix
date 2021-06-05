class Viewer {
  int idViewer;
  int idAccount;
  String name;
  String pinNumber;
  bool isKid;

  Viewer(
      {this.idViewer, this.idAccount, this.name, this.pinNumber, this.isKid});

  Viewer.fromJson(Map<String, dynamic> json) {
    idViewer = json['id_viewer'];
    idAccount = json['id_account'];
    name = json['name'];
    pinNumber = json['pin_number'];
    isKid = json['is_kid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_viewer'] = this.idViewer;
    data['id_account'] = this.idAccount;
    data['name'] = this.name;
    data['pin_number'] = this.pinNumber;
    data['is_kid'] = this.isKid;
    return data;
  }
}
