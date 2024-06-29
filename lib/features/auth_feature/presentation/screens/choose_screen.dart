import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
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

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                  128.verticalSpace,
                  ButtonWidget(
                    text: "تسجيل الدخول",
                    onPressed:() {
                      navigateTo(LoginScreen(),removeAll: true);
                    },
                  ),
                  16.verticalSpace,
                  ButtonWidget(
                    text: "الدخول كضيف",
                    color: AppColors.white,
                    textColor: AppColors.mainColor,
                    onPressed:() {
                      navigateTo(BNBScreen(),removeAll: true);
                    },
                  ),
                  256.verticalSpace,
                  TextWidget(
                    title: "جميع الحقوق محفوظه -جامعة الزقازيق كلية الحاسبات والمعلومات 2023",
                    titleSize: 15.sp,
                    titleColor: AppColors.white,
                    titleFontWeight: FontWeight.w500,
                  ),
                  20.verticalSpace,
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}
