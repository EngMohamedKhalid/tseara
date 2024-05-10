import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/auth_feature/presentation/screens/register_screen.dart';
import 'package:tseara/features/home_feature/presentation/screens/home_screen.dart';
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
      body:
      Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: const AssetImage(
                    AppImages.back,
                  ),
                )
            )
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.5),
                    Colors.black.withOpacity(.9),
                  ],
                ),
            ),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                var cu = AuthCubit.get();
                return Form(
                  key: formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 50.sp, ),
                    children: [
                      80.verticalSpace,
                      ImageWidget(
                        imageUrl: AppImages.appLogo,
                        width: 150.w,
                        height: 100.h,
                      ),
                      15.verticalSpace,
                      TextWidget(
                        title: "اهلا بك في تسعيره ",
                        titleFontWeight: FontWeight.normal,
                        titleSize: 22.sp,
                        titleColor: AppColors.white,
                      ),
                      60.verticalSpace,
                      CustomFormField(
                        hint: "email".tr(),
                        controller: cu.loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        errorText:  cu.errorMsg,
                      ),
                      20.verticalSpace,
                      CustomFormField(
                        hint: "Password".tr(),
                        controller: cu.loginPasswordController,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomTextButton(
                          onPressed: () {
                            navigateTo( ForgetPasswordScreen());
                          },
                          title: "هل نسيت كلمة السر ؟".tr(),
                          titleColor: AppColors.white,
                          textDecoration: TextDecoration.underline,
                          titleFontWeight: FontWeight.bold,
                          titleSize: 15.sp,
                        ),
                      ),
                      50.verticalSpace,
                      ButtonWidget(
                        loading: state is LoadingState,
                        outlined: true,
                        onPressed: () {
                          //navigateTo(HomeScreen(),removeAll: true);
                          cu.login();
                          // if(formKey.currentState!.validate()){
                          //   cu.login();
                          // }
                        },
                        text: "تسجيل الدخول".tr(),
                      ),
                      20.verticalSpace,
                      ButtonWidget(
                        loading: state is LoadingState,
                        outlined: true,
                        color: AppColors.white,
                        textColor: AppColors.black,
                        icon: ImageWidget(
                          imageUrl: AppImages.Google,
                          width: 30.w,
                          height: 30.h,
                        ),
                        onPressed: () {
                          //navigateTo(BNBScreen(),removeAll: true);
                          // if(formKey.currentState!.validate()){
                          //   //cu.login();
                          // }
                        },
                        text: "تسجيل الدخول ب جوجل".tr(),
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                            onPressed: () {
                              navigateTo(const RegisterScreen());
                            },
                            title: " انشاء حساب",
                            titleColor: AppColors.blue,
                            fontFamily: AppFonts.semiBold,
                            titleFontWeight: AppFonts.semiBold500,
                            titleSize: 14.sp,
                          ),
                          TextWidget(
                            title: "ليس لديك حساب بالفعل؟",
                            titleSize: 15.sp,
                            titleColor: AppColors.white,
                            titleFontWeight: FontWeight.w500,
                          ),
                          //5.horizontalSpace,
                        ],
                      ),
                      80.verticalSpace,
                      TextWidget(
                        title: "جميع الحقوق محفوظه -جامعة الزقازيق كلية الحاسبات والمعلومات 2023",
                        titleSize: 15.sp,
                        titleColor: AppColors.white,
                        titleFontWeight: FontWeight.w500,
                      ),
                      20.verticalSpace,
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
