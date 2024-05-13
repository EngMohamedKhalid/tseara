class CategoryModel {
  CategoryModel({
      this.categoryName, 
      this.image, 
      this.subCategoriesNames,});

  CategoryModel.fromJson(dynamic json) {
    categoryName = json['categoryName'];
    image = json['image'];
    subCategoriesNames = json['subCategoriesNames'] != null ? json['subCategoriesNames'].cast<String>() : [];
  }
  String? categoryName;
  String? image;
  List<String>? subCategoriesNames;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryName'] = categoryName;
    map['image'] = image;
    map['subCategoriesNames'] = subCategoriesNames;
    return map;
  }

}