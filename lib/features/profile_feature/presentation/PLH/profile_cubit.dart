import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tseara/app/utils/dio_helper.dart';

import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../../app/widgets/flutter_toast.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final nationalIdController = TextEditingController();
  final complaintController = TextEditingController();
  void addReport(){
    emit(ProfileLoading());
    DioHelper.postWithFormData(
        url: "Complaints/AddComplaint",
        data: FormData.fromMap({
          "UserName":userNameController.text,
          "Email":userEmailController.text,
          "ComplaintAddress":addressController.text,
          "PhoneNumber":phoneController.text,
          "National_Id":nationalIdController.text,
          "complaintDetails":complaintController.text,
        }),
    ).then((value) {
      showToast(msg: value.data['message']);
      clearController();
      emit(ProfileInitial());
    }).catchError((e){
      print(e.toString());
      emit(ProfileInitial());
    });

  }

  void clearController(){
    userNameController.clear();
    userEmailController.clear();
    addressController.clear();
    phoneController.clear();
    nationalIdController.clear();
    complaintController.clear();
  }
}
