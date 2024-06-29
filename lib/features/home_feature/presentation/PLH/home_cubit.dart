import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:tseara/features/home_feature/data/models/get_home_favourites_model.dart';
import 'package:tseara/features/home_feature/data/models/port_model.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/dio_helper.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../data/models/category_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  List<PortModel> ?ports;
  List<PortModel> ?searchPorts;
  GetHomeFavouritesModel ?getHomeFavouritesModel;
  void getPorts({ int? type , int? govern}) {
    emit(HomeLoading());
    DioHelper.getData(
        url: 'Port/GetAllPorts',
      queryParameters: {
          "PortType":type??null,
          "governorate":govern??null,
      }
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

  void getHomeFavorites() {
    emit(HomeFavLoaded());
    print("started");
    DioHelper.getData(
      url: "Account/GetCurrentUser2",
    ).then((value)async {
      print(value.data);
      getHomeFavouritesModel = GetHomeFavouritesModel.fromJson(value.data);
      print(getHomeFavouritesModel?.userId);
      await getIt<CacheService>().setUserId(Id: getHomeFavouritesModel?.userId??"",);
      print(getHomeFavouritesModel?.favoriteProducts?.length??0);
      print("=====home fav==========");
      emit(HomeFavInitial());
    }).catchError((error) {
      print(error.toString());
      getIt<CacheService>().getUserToken() == null?
      null:
      globalAlertDialogue("انتهت مدة صالحية التسجيل",onOk: () {
        navigateTo(LoginScreen(),removeAll: true);
      });
      emit(HomeFavInitial());
    });
  }
}
