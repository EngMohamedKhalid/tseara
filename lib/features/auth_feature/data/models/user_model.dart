class UserModel {
  UserModel({
      this.userName, 
      this.isAuthanticated, 
      this.email, 
      this.role, 
      this.token, 
      this.massage, 
      this.refreshTokenExpire,});

  UserModel.fromJson(dynamic json) {
    userName = json['userName'];
    isAuthanticated = json['isAuthanticated'];
    email = json['email'];
    role = json['role'] != null ? json['role'].cast<String>() : [];
    token = json['token'];
    massage = json['massage'];
    refreshTokenExpire = json['refreshTokenExpire'];
  }
  String? userName;
  bool? isAuthanticated;
  String? email;
  List<String>? role;
  String? token;
  String? massage;
  String? refreshTokenExpire;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['isAuthanticated'] = isAuthanticated;
    map['email'] = email;
    map['role'] = role;
    map['token'] = token;
    map['massage'] = massage;
    map['refreshTokenExpire'] = refreshTokenExpire;
    return map;
  }

}