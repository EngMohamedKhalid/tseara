import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tseara/app/widgets/custom_alert_dialog.dart';
import 'package:tseara/features/auth_feature/data/models/user_model.dart';
import 'package:tseara/features/auth_feature/domain/use_cases/auth_usecases/login_use_case.dart';
import 'package:tseara/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:tseara/features/home_feature/presentation/screens/home_screen.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/dio_helper.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../domain/use_cases/auth_usecases/register_use_case.dart';
import '../../domain/use_cases/auth_usecases/resend_otp_usecase.dart';
import '../screens/login_screen.dart';
import '../screens/reset_password_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

//this is for login
  final loginPasswordController = TextEditingController();
  final loginEmailController = TextEditingController();
  //this is for forget password
  final forgetEmailController = TextEditingController();
  //this is for otp
  final otpEmailController = TextEditingController();
  final otpController = TextEditingController();
  //this is for reset password
  final resetTokenController = TextEditingController();
  final resetPassController = TextEditingController();
  final resetPassConfirmController = TextEditingController();
  //this is for sign up
  final registerFirstNameController = TextEditingController();
  final registerLastNameController = TextEditingController();
  final registerFullNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerNationalIdController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerPassController = TextEditingController();
  final registerConfPassController = TextEditingController();

  bool passObscure = true;
  bool passConfObscure = true;
  String ? errorMsg;
  UserModel ? userModel;
  void changeVisible(){
    emit(LoadingState());
    passObscure = !passObscure;
    emit(AuthInitial());
  }
  void changeConfVisible(){
    emit(LoadingState());
    passConfObscure = !passConfObscure;
    emit(AuthInitial());
  }

  void login() {
    emit(LoadingState());
    DioHelper.postData(
        url: 'Account/Login',
        data: {
          "email": loginEmailController.text,
          "password": loginPasswordController.text
        }).then((value)async {
      userModel = UserModel.fromJson(value.data);
      await getIt<CacheService>().setUserToken(token: userModel?.token??"");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(userModel?.toJson()));
      navigateTo( const BNBScreen(),removeAll: true);
      emit(AuthInitial());
    }).catchError((error) {
      globalAlertDialogue("!!يوجد خطأ في  البريد الالكتروني او كلمه المرور");
      print(error.toString());
      emit(AuthInitial());
    });
  }
  void register() {
    emit(LoadingState());
    DioHelper.postData(
        url: 'Account/Register',
        data:{
          "firstName":registerFirstNameController.text,
          "lastName": registerLastNameController.text,
          "usreName": registerFullNameController.text,
          "email": registerEmailController.text,
          "national_Id":registerNationalIdController.text,
          "password":registerPassController.text,
          "confirmPassword": registerConfPassController.text,
          "phoneNumber": registerPhoneController.text,
        }).then((value)async {
      userModel = UserModel.fromJson(value.data);
      await getIt<CacheService>().setUserToken(token: userModel?.token??"");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(userModel?.toJson()));
      navigateTo( const BNBScreen(),removeAll: true);
      print("user token is ${userModel?.token??"No token"}");
      print(getIt<CacheService>().getUserData());
      print(getIt<CacheService>().getUserData()?.token);
      emit(AuthInitial());
    }).catchError((error) {
      globalAlertDialogue("تأكد من البيانات المدخله وان كلمة المرور لا تقل عن 6 ارقام");
      print(error.toString());
      emit(AuthInitial());
    });
  }

  void forgetPassword(){
    emit(LoadingState());
    DioHelper.postData(
        url: 'Account/ForgetPassword',
        data:{
          "email": forgetEmailController.text,
        }).then((value) {
        showToast(msg: "تم ارسال رسالة التحقق على البريد الالكتروني");
        navigateTo(ResetPasswordScreen());
      emit(AuthInitial());
    }).catchError((error) {
      globalAlertDialogue("couldn't send email ,please use an valid email");
      print(error.toString());
      emit(AuthInitial());
    });
  }

  void resetPassword(){
    emit(LoadingState());
    DioHelper.postWithFormData(
        url: 'Account/ResetPassord',
        data:FormData.fromMap({
          "Email": forgetEmailController.text,
          "Token": resetTokenController.text,
          "NewPassword": resetPassController.text,
          "ConfirmPassword": resetPassController.text,
        })
    ).then((value) {
      if(value.statusCode == 200){
        showToast(msg: "تم تغيير كلمة المرور بنجاح");
        navigateTo(LoginScreen());
      } else {
        globalAlertDialogue(value.data["InvalidToken"].toString());
      }
      emit(AuthInitial());
    }).catchError((error) {
      print(error.toString());
      emit(AuthInitial());
    });
  }

}
