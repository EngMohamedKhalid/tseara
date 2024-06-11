import '../../../categories_feature/data/models/sub_category_model.dart';

class GetHomeFavouritesModel {
  GetHomeFavouritesModel({
      this.userId, 
      this.firstName, 
      this.lastName, 
      this.usreName, 
      this.email, 
      this.nationalId, 
      this.phoneNumber, 
      this.favoriteProducts,});

  GetHomeFavouritesModel.fromJson(dynamic json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    usreName = json['usreName'];
    email = json['email'];
    nationalId = json['national_Id'];
    phoneNumber = json['phoneNumber'];
    if (json['favoriteProducts'] != null) {
      favoriteProducts = [];
      json['favoriteProducts'].forEach((v) {
        favoriteProducts?.add(Products.fromJson(v));
      });
    }
  }
  String? userId;
  String? firstName;
  String? lastName;
  String? usreName;
  String? email;
  String? nationalId;
  String? phoneNumber;
  List<Products>? favoriteProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['usreName'] = usreName;
    map['email'] = email;
    map['national_Id'] = nationalId;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}