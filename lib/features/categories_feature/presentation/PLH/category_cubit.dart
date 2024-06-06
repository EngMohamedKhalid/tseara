import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tseara/features/categories_feature/data/models/sub_category_model.dart';
import 'package:tseara/features/home_feature/data/models/port_model.dart';

import '../../../../app/utils/dio_helper.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../home_feature/data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  List<CategoryModel> ?categories;
  List<CategoryModel> ?searchCategories;

  List<SubCategoryModel> ?subCategories;
  List<SubCategoryModel> ?subCategoriesSearch;
  List<String?> ? titles;

  void getCategories() {
    emit(CategoryLoading());
    DioHelper.getData(
      url: 'Category/GetAll',
    ).then((value) {
      categories = (value.data as List).map((e) => CategoryModel.fromJson(e)).toList();
      searchCategories = categories;
      print(categories?.length??0);
      print("=========================");
      emit(CategoryInitial());
    }).catchError((error) {
      print(error.toString());
      emit(CategoryInitial());
    });
  }
  void searchCategory({required String searchKey}){
    emit(CategorySearchLoading());
    List<CategoryModel>? result=[];
    if(searchKey.isEmpty){
      result = categories;
      emit(CategoryInitial());
    }else{
      result = categories?.where((element) {
        return  element.categoryName!.toLowerCase().contains(searchKey.toLowerCase());
      }).toList();
    }
    searchCategories = result;
    emit(CategoryInitial());
  }

  void getSubCategory({required int id}) {
    emit(CategoryLoading());
    DioHelper.getData(
      url: 'SubCategory/GetSubcategoryWithCategoryId?CategoryId=$id',
    ).then((value) {
      subCategories = (value.data as List).map((e) => SubCategoryModel.fromJson(e)).toList();
      subCategoriesSearch = subCategories;
      titles = subCategories?.map((e) => e.subCategoryName).toList();
      print(categories?.length??0);
      print(titles);
      print("=======From SubCategory========");
      emit(CategoryInitial());
    }).catchError((error) {
      print(error.toString());
      emit(CategoryInitial());
    });
  }
}
