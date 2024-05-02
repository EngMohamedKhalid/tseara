import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../data/models/onboard_model.dart';
import '../screens/get_started_screen.dart';
class CustomOnBoardBody extends StatelessWidget {
  const CustomOnBoardBody({super.key, required this.onBoardModel});
 final OnBoardModel onBoardModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ImageWidget(
            imageUrl: onBoardModel.image,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        30.verticalSpace,
        TextWidget(
          title: onBoardModel.title1,
          titleColor: AppColors.mainColor,
          titleSize: 25.sp,
          fontFamily: AppFonts.bold,
          titleFontWeight: FontWeight.bold,
        ),
        25.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: TextWidget(
            title: onBoardModel.title2,
            titleColor: AppColors.black,
            titleSize: 25.sp,
            titleMaxLines: 50,
            height: 1.h,
            fontFamily: AppFonts.regular,
            titleFontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
