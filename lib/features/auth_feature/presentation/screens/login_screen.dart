import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/auth_feature/presentation/screens/register_screen.dart';
import '../../../../../app/utils/app_assets.dart';
import '../../../../../app/utils/app_colors.dart';
import '../../../../../app/utils/helper.dart';
import '../../../../../app/widgets/button_widget.dart';
import '../../../../../app/widgets/custom_form_field.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_button_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "Get Started",
        centerTitle: true,
        notify: false,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cu = AuthCubit.get();
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 29.sp, ),
              children: [
                80.verticalSpace,
                Row(
                  children: [
                    TextWidget(
                        title: "Please fill your details to login.",
                      titleFontWeight: FontWeight.normal,
                      titleSize: 16.sp,
                      titleColor: AppColors.black252525,
                    ),
                  ],
                ),
                37.verticalSpace,
                CustomFormField(
                  hint: "Username/email".tr(),
                  controller: cu.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText:  cu.errorMsg,
                ),
                24.verticalSpace,
                CustomFormField(
                  hint: "Password".tr(),
                  controller: cu.loginPasswordController,
                  suffixIcon: cu.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cu.passObscure,
                  iconPressed: () {
                    cu.changeVisible();
                  },
                ),
                33.verticalSpace,
                ButtonWidget(
                  loading: state is LoadingState,
                  width: 200.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    //navigateTo(BNBScreen(),removeAll: true);
                    if(formKey.currentState!.validate()){
                      //cu.login();
                    }
                  },
                  text: "Get Started".tr(),
                ),
                15.verticalSpace,
                CustomTextButton(
                  onPressed: () {
                    navigateTo( ForgetPasswordScreen());
                  },
                  title: "forgetPass".tr(),
                  titleColor: AppColors.black,
                  textDecoration: TextDecoration.underline,
                  titleFontWeight: FontWeight.w500,
                  titleSize: 14.sp,
                ),
                246.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: "New Member?",
                      titleSize: 15.sp,
                      titleColor: AppColors.black,
                      titleFontWeight: FontWeight.w500,
                    ),
                    //5.horizontalSpace,
                    CustomTextButton(
                      onPressed: () {
                        navigateTo(const RegisterScreen());
                      },
                      title: "Register",
                      titleColor: AppColors.black,
                      fontFamily: AppFonts.semiBold,
                      titleFontWeight: AppFonts.semiBold500,
                      titleSize: 14.sp,
                    ),
                  ],
                ),
                16.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
