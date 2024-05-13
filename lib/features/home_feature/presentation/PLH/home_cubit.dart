import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tseara/features/home_feature/data/models/port_model.dart';

import '../../../../app/utils/dio_helper.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../data/models/category_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  List<CategoryModel> ?categories;
  List<CategoryModel> ?searchCategories;
  List<PortModel> ?ports;
  List<PortModel> ?searchPorts;
  void getCategories() {
    emit(HomeCategoriesLoaded());
    DioHelper.getData(
        url: 'Category/GetAll',
    ).then((value) {
      categories = (value.data as List).map((e) => CategoryModel.fromJson(e)).toList();
      searchCategories = categories;
      print(categories?.length??0);
      print("=========================");
      emit(HomeInitial());
    }).catchError((error) {
      print(error.toString());
      emit(HomeInitial());
    });
  }
  void getPorts() {
    emit(HomeLoading());
    DioHelper.getData(
        url: 'Port/GetAllPorts',
    ).then((value) {
      ports = (value.data as List).map((e) => PortModel.fromJson(e)).toList();
      searchPorts = ports;
      print(ports?.length??0);
      print("=========================");
      emit(HomeInitial());
    }).catchError((error) {
      print(error.toString());
      emit(HomeInitial());
    });
  }


  void searchCategory({required String searchKey}){
    emit(HomeLoading());
    List<CategoryModel>? result=[];
    if(searchKey.isEmpty){
      result = categories;
      emit(HomeInitial());
    }else{
      result = categories?.where((element) {
        return  element.categoryName!.toLowerCase().contains(searchKey.toLowerCase());
      }).toList();
    }
    searchCategories = result;
    emit(HomeInitial());
  }
  void searchPort({required String searchKey}){
    emit(HomeLoading());
    List<PortModel>? result=[];
    if(searchKey.isEmpty){
      result = ports;
      emit(HomeInitial());
    }else{
      result = ports?.where((element) {
        return  element.portName!.toLowerCase().contains(searchKey.toLowerCase());
      }).toList();
    }
    searchPorts = result;
    emit(HomeInitial());
  }
}
