class SubCategoryModel {
  SubCategoryModel({
      this.subCategoryName, 
      this.image, 
      this.categoryName, 
      this.products,});

  SubCategoryModel.fromJson(dynamic json) {
    subCategoryName = json['subCategoryName'];
    image = json['image'];
    categoryName = json['categoryName'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? subCategoryName;
  dynamic image;
  String? categoryName;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subCategoryName'] = subCategoryName;
    map['image'] = image;
    map['categoryName'] = categoryName;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      this.productName, 
      this.priceFrom, 
      this.priceTo, 
      this.lastUpdate, 
      this.subCategoryName, 
      this.image, 
      this.isAvailable,});

  Products.fromJson(dynamic json) {
    productName = json['productName'];
    priceFrom = json['price_From'];
    priceTo = json['price_To'];
    id = json['id'];
    lastUpdate = json['lastUpdate'];
    subCategoryName = json['subCategoryName'];
    image = json['image'];
    isAvailable = json['isAvailable'];
  }
  String? productName;
  num? priceFrom;
  num? priceTo;
  int? id;
  String? lastUpdate;
  String? subCategoryName;
  String? image;
  bool? isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = productName;
    map['price_From'] = priceFrom;
    map['price_To'] = priceTo;
    map['id'] = id;
    map['lastUpdate'] = lastUpdate;
    map['subCategoryName'] = subCategoryName;
    map['image'] = image;
    map['isAvailable'] = isAvailable;
    return map;
  }

}