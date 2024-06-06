import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tseara/features/categories_feature/presentation/screens/categories_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/add_report_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/profile_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/setting_screen.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../home_feature/presentation/screens/home_screen.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationStats> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  static BottomNavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens =const  [
    HomeScreen(),
    CategoriesScreen(),
    AddReportScreen(),
    SettingScreen(),
  ];
  void changeCurrent(int index)
  {
    emit(BottomNavigationInitial());
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }
}
