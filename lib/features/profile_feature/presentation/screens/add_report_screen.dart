import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/custom_form_field.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';

class AddReportScreen extends StatelessWidget {
  const AddReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "",
        centerTitle: true,
        notify: false,
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
            hint: "الأرز المعباء/كيلو",
          ),
          16.verticalSpace,
          CustomFormField(
            hint: "متوفر",
          ),
          16.verticalSpace,
          CustomFormField(
            hint: "عنوان الشكوهِ",
          ),
          16.verticalSpace,
          CustomFormField(
            hint: "التليفونِ",
          ),
          16.verticalSpace,
          CustomFormField(
            hint: "الرقم القومي",
          ),
          16.verticalSpace,
          CustomFormField(
            hint: "تفاصيل الشكوي",
            maxLines: 5000,
            minLines: 5000,
            height: 150.h,
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
          text: "أرسل شكوي",
          color: AppColors.black,
        ),
      ),
    );
  }
}
