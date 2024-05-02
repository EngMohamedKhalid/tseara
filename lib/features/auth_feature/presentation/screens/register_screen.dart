import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/utils/app_assets.dart';
import '../../../../../app/utils/app_colors.dart';
import '../../../../../app/utils/helper.dart';
import '../../../../../app/widgets/button_widget.dart';
import '../../../../../app/widgets/custom_form_field.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_button_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import 'login_screen.dart';

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
      appBar: DefaultAppBarWidget(
        title: "Register",
        centerTitle: true,
        notify: false,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cu = AuthCubit.get();
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 29.sp,),
              children: [
                80.verticalSpace,
                Row(
                  children: [
                    TextWidget(
                      title: "Please fill your details to sign up.",
                      titleFontWeight: FontWeight.normal,
                      titleSize: 16.sp,
                      titleColor: AppColors.black252525,
                    ),
                  ],
                ),
                37.verticalSpace,
                CustomFormField(
                  hint: "Username".tr(),
                  controller: cu.registerNameController,
                  errorText:  cu.errorMsg,
                ),
                24.verticalSpace,
                CustomFormField(
                  hint: "Email".tr(),
                  controller: cu.registerEmailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText:  cu.errorMsg,
                ),
                24.verticalSpace,
                CustomFormField(
                  hint: "Password".tr(),
                  controller: cu.registerPassController,
                  suffixIcon: cu.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cu.passObscure,
                  iconPressed: () {
                    cu.changeVisible();
                  },
                ),
                24.verticalSpace,
                CustomFormField(
                  hint: "Confirm Password",
                  controller: cu.registerConfPassController,
                  suffixIcon: cu.passConfObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cu.passConfObscure,
                  iconPressed: () {
                    cu.changeConfVisible();
                  },
                ),
                24.verticalSpace,
                CustomFormField(
                  hint: "Address".tr(),
                  controller: cu.registerAddressController,
                  errorText:  cu.errorMsg,
                ),
                40.verticalSpace,
                ButtonWidget(
                  loading: state is LoadingState,
                  width: 200.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    cu.registerUser();
                    // if(formKey.currentState!.validate()&&cu.registerPassController.text==cu.registerConfPassController.text){
                    //   cu.registerUser();
                    // }else{
                    //   showToast(msg: "Password does not match confirm password", backgroundColor: AppColors.red, textColor: Colors.white);
                    // }
                  },
                  text: "Register",
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
