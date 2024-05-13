import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  bool isDarkMode =false;
  void changeThemeMode(String mode){
    emit(ChangeTheme());
    isDarkMode = mode =="dark";
    emit(ProfileInitial());
    //ThemeCubit.get().changeThemeMode(mode);
  }
}
