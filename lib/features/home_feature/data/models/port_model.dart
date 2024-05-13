class PortModel {
  PortModel({
      this.portName, 
      this.type, 
      this.governorate,});

  PortModel.fromJson(dynamic json) {
    portName = json['portName'];
    type = json['type'];
    governorate = json['governorate'];
  }
  String? portName;
  String? type;
  String? governorate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['portName'] = portName;
    map['type'] = type;
    map['governorate'] = governorate;
    return map;
  }

}