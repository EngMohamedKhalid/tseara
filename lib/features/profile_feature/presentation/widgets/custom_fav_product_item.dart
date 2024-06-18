import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/features/profile_feature/presentation/screens/add_report_screen.dart';

import '../../../../app/widgets/text_widget.dart';
class CustomFavProductItem extends StatelessWidget {
  const CustomFavProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xffECECEC),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 30.sp,

                  ),
                  16.horizontalSpace,
                  ImageWidget(
                    imageUrl: "assets/images/product.png",
                    width: 90.w,
                    height: 90.h,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              16.verticalSpace,
              TextWidget(
                title: "الجبن الابيض/كيلو",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              TextWidget(
                title: "متوفر",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.w500,
              ),
              10.verticalSpace,
              TextWidget(
                title: "من510:82جنيه",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              10.verticalSpace,
              ButtonWidget(
                text: "أرسل شكوي",
                width: 200.w,
                onPressed: () {
                  navigateTo(AddReportScreen(isBNB: false,));
                },
              ),
            ],
          ),
        ),
        TextWidget(
          title: "تم التحديث في 14/12/2023",
          titleSize: 15.sp,
          titleColor: AppColors.gery455,
        ),
      ],
    );
  }
}
