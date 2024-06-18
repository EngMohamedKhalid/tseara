import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/custom_form_field.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/features/profile_feature/presentation/PLH/profile_cubit.dart';

class AddReportScreen extends StatelessWidget {
  const AddReportScreen({super.key, this.isBNB = true});

  final bool isBNB;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get();
        return Scaffold(
          appBar: DefaultAppBarWidget(
            title: "",
            centerTitle: true,
            notify: false,
            canBack: isBNB ? false : true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              GifView.asset(
                'assets/images/complement.gif',
                height: 200,
                width: 200,
                frameRate: 30, // default is 15 FPS
              ),
              CustomFormField(
                hint: "اسم المستخدم",
                controller: cubit.userNameController,
              ),
              16.verticalSpace,
              CustomFormField(
                hint: "البريد الالكتروني",
                controller: cubit.userEmailController,
              ),
              16.verticalSpace,
              CustomFormField(
                hint: "عنوان الشكوهِ",
                controller: cubit.addressController,
              ),
              16.verticalSpace,
              CustomFormField(
                hint: "التليفونِ",
                controller: cubit.phoneController,
              ),
              16.verticalSpace,
              CustomFormField(
                hint: "الرقم القومي",
                controller: cubit.nationalIdController,
              ),
              16.verticalSpace,
              CustomFormField(
                hint: "تفاصيل الشكوي",
                maxLines: 5000,
                minLines: 5000,
                height: 150.h,
                controller: cubit.complaintController,
              ),
              16.verticalSpace
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              bottom: 40.h,
              left: 20.w,
              right: 20.w,
            ),
            child: ButtonWidget(
              loading: state is ProfileLoading,
              text: "أرسل شكوي",
              onPressed: () {
                cubit.addReport();
              },
              color: AppColors.black,
            ),
          ),
        );
      },
    );
  }
}
