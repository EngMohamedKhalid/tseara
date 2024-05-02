import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
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
  //this is for otp
  final otpEmailController = TextEditingController();
  final otpController = TextEditingController();
  //this is for reset password
  final resetPassController = TextEditingController();
  final resetPassConfirmController = TextEditingController();
  //this is for sign up
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerAddressController = TextEditingController();
  final registerPassController = TextEditingController();
  final registerConfPassController = TextEditingController();
  bool passObscure = true;
  bool passConfObscure = true;
  String ? errorMsg;

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

  void registerUser()async{
    emit(LoadingState());
    final res = await getIt<RegisterUseCase>()(RegisterUSeCaseParams(
       // email: registerEmailController.text,
       // name: registerNameController.text,
       // address: registerAddressController.text,
       // password: registerPassController.text,
       //  password_confirmation: registerConfPassController.text,
        email: "mohamedkhalidshawky@gmail.com",
        name: "Mohamed",
        address: "Cairo",
        password:"123456",
        password_confirmation: "123456"

    ),
    );
    res.fold(
           (l) {
             errorStateHandler(l);
             print(l.cause.toString());
           },
            (r) {
              print(r);
              navigateTo(LoginScreen());
            },
    );
    emit(AuthInitial());

  }




}
