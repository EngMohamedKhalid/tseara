import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/intro_feature/presentation/screens/on_boarding_screen.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/login_screen.dart';
import '../../../auth_feature/presentation/screens/register_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            30.verticalSpace,
            ImageWidget(
              imageUrl: AppImages.appLogo,
              width: 150.w,
              height: 100.h,
            ),
            TextWidget(
              title: "اهلا بكم في تسعيره",
              titleColor: AppColors.mainColor,
              titleSize: 30.sp,
              fontFamily: AppFonts.semiBold,
              titleFontWeight: AppFonts.semiBold500,
            ),
            46.verticalSpace,
            TextWidget(
              title: "مكانك الأمن لمعرفة اسعار المنتجات المصريه",
              titleColor: AppColors.black,
              titleSize: 22.sp,
            ),
            46.verticalSpace,
            ImageWidget(
              imageUrl: AppImages.started,
              height: 335.h,
              width: double.infinity,
            ),
            20.verticalSpace
          ],
        ),
        bottomNavigationBar:   ButtonWidget(
          horizontalMargin: 50.w,
          verticalMargin: 50,
          onPressed: () {
            navigateTo(OnBoardingScreen(), replace: true);
          },
          text: "ابدا",
        ),
      ),
    );
  }
}
