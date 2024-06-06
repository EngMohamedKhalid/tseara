import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.fromCheckOut = false});

  final bool fromCheckOut;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fNameCont = TextEditingController();
  TextEditingController lNameCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  XFile? userImage;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          title: 'تعديل بياناتك',
          centerTitle: true,
          notify: false,
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                GifView.asset(
                  'assets/images/edit.gif',
                  height: 200,
                  width: 200,
                  frameRate: 30, // default is 15 FPS
                ),
                20.verticalSpace,
                CustomFormField(
                  header: "ألأسم ألأول",
                  controller: fNameCont,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "ألأسم الأخير",
                  controller: lNameCont,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "بريدك الألكتروني",
                  controller: emailCont,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "الرقم القومي",
                  controller: emailCont,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "كلمة المرور",
                  controller: passwordCont,
                  suffixIcon: Icons.visibility_off,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "تأكيد كلمة المرور",
                  controller: passwordCont,
                  suffixIcon: Icons.visibility_off,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "رقم الهاتف",
                  controller: fNameCont,
                ),
                16.verticalSpace,
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Container(
                padding: EdgeInsets.all(16.sp),
                child: ButtonWidget(
                  loading: state is LoadingState,
                  color: AppColors.blue,
                  onPressed: () {},
                  text: "تعديل",
                  mainAxisAlignment: MainAxisAlignment.center,
                  textColor: AppColors.white,
                ));
          },
        ),
      ),
    );
  }
}
