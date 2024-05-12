import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/auth_feature/presentation/screens/login_screen.dart';
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
import '../../../home_feature/presentation/screens/home_screen.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import 'forget_password_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                        50.verticalSpace,
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
                          hint: "First Name".tr(),
                          controller: cu.registerFirstNameController,
                          errorText:  cu.errorMsg,
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "Last Name".tr(),
                          controller: cu.registerLastNameController,
                          errorText:  cu.errorMsg,
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "Full Name".tr(),
                          controller: cu.registerFullNameController,
                          errorText:  cu.errorMsg,
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "email".tr(),
                          controller: cu.registerEmailController,
                          keyboardType: TextInputType.emailAddress,
                          errorText:  cu.errorMsg,
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "National Id".tr(),
                          controller: cu.registerNationalIdController,
                          keyboardType: TextInputType.number,
                          errorText:  cu.errorMsg,
                          maxLength: 14,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return "National Id is Required".tr();
                            }else if(value.length<14){
                              return "National Id is not valid".tr();
                            }
                            return null;
                          },
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "Phone Number".tr(),
                          controller: cu.registerPhoneController,
                          keyboardType: TextInputType.number,
                          errorText:  cu.errorMsg,
                          maxLength: 11,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return "Phone is Required".tr();
                            }else if(value.length!=11){
                              return "National Id is not valid".tr();
                            }
                            return null;
                          },
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "Password".tr(),
                          controller: cu.registerPassController,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return "Password is Required".tr();
                            }else if(value.length<6){
                              return "Password must be at least 6 characters".tr();
                            }
                            return null;
                          },
                        ),
                        20.verticalSpace,
                        CustomFormField(
                          hint: "Confirm Password".tr(),
                          controller: cu.registerConfPassController,
                          validator:(value) {
                            if (value!.isEmpty) {
                              return "Confirm Password is Required".tr();
                            }else if(value.length<6){
                              return "Confirm Password must be at least 6 characters".tr();
                            }
                            return null;
                          },
                        ),
                        50.verticalSpace,
                        ButtonWidget(
                          loading: state is LoadingState,
                          outlined: true,
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              print(",${(cu.registerNationalIdController.text.substring(0,13)).length}");
                              cu.register();
                            }
                          },
                          text: " انشاء حساب".tr(),
                        ),
                        20.verticalSpace,
                        // ButtonWidget(
                        //   loading: state is LoadingState,
                        //   outlined: true,
                        //   color: AppColors.white,
                        //   textColor: AppColors.black,
                        //   icon: ImageWidget(
                        //     imageUrl: AppImages.Google,
                        //     width: 30.w,
                        //     height: 30.h,
                        //   ),
                        //   onPressed: () {
                        //     //navigateTo(BNBScreen(),removeAll: true);
                        //     // if(formKey.currentState!.validate()){
                        //     //   //cu.login();
                        //     // }
                        //   },
                        //   text: "تسجيل الدخول ب جوجل".tr(),
                        // ),
                        // 20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextButton(
                              onPressed: () {
                                navigateTo(const LoginScreen());
                              },
                                title: "تسجيل الدخول",
                              titleColor: AppColors.blue,
                              fontFamily: AppFonts.semiBold,
                              titleFontWeight: AppFonts.semiBold500,
                              titleSize: 14.sp,
                            ),
                            TextWidget(
                              title: "لديك حساب بالفعل؟ ",
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
