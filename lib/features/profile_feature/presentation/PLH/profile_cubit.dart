import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tseara/app/utils/dio_helper.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/features/home_feature/presentation/PLH/home_cubit.dart';

import '../../../../app/services/cache_service.dart';
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
  /////////////////

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nIdController = TextEditingController();
  XFile? userImage;
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
          "AddAtachment":userImage==null?null:File(userImage!.path),
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

  void editProfile()async{
    emit(ProfileLoading());
    DioHelper.putData(
        url: "Account/EditProfiel?userid=${getIt<CacheService>().getUserId()}",
        data: {
          "firstName":firstNameController.text,
          "lastName":lastNameController.text,
          "usreName":fullNameController.text,
          "email":emailController.text,
          "national_Id":nIdController.text,
          "phoneNumber":phoneNumberController.text,
        },
    ).then((value) {
      showToast(msg:"Profile Updated Successfully");
      HomeCubit.get().getHomeFavorites();
      goBack();
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
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    nIdController.clear();
    lastNameController.clear();
    firstNameController.clear();
    userImage=null;
  }

  Future<void> addToCart({required int productId})async{
    emit(ProfileLoading());
    DioHelper.postData(
      url: "FavoriteProducts/AddFavoriteProduct",
      //"Account/EditProfiel?userid=${getIt<CacheService>().getUserId()}",
      data: {
        "productId": productId,
        "userId": await getIt<CacheService>().getUserId()
      },
    ).then((value) {
      showToast(msg:value.data);
      HomeCubit.get().getHomeFavorites();
      emit(ProfileInitial());
    }).catchError((e){
      showToast(msg:"The Product Already Favorite !!");
      emit(ProfileInitial());
    });

  }

  Future<void> removeFromCart({required int productId})async{
    emit(ProfileLoading());
    DioHelper.deleteData(
      url: "FavoriteProducts/DeleteProductFromFavorite",
      //"Account/EditProfiel?userid=${getIt<CacheService>().getUserId()}",
      data: {
        "productId": productId,
        "userId": await getIt<CacheService>().getUserId()
      },
    ).then((value) {
      showToast(msg:value.data);
      HomeCubit.get().getHomeFavorites();
      emit(ProfileInitial());
    }).catchError((e){
      print(e.toString());
      emit(ProfileInitial());
    });

  }
}
