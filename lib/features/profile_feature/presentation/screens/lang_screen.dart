import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:DefaultAppBarWidget(
        title: "lang".tr(),
        centerTitle: true,
        notify: false,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: ()async{
              if(context.locale.languageCode!="ar"){
                await context.setLocale(const Locale("ar"));
                //navigateTo(const BNBScreen(),removeAll: true);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              decoration: BoxDecoration(
                  color:  context.locale.languageCode=="ar"?AppColors.mainColor:Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color:  context.locale.languageCode=="ar"?AppColors.mainColor:AppColors.gery455,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: "العربية",
                    titleColor: context.locale.languageCode=="ar"?AppColors.white:AppColors.gery455,
                    titleSize: 19.sp,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    size: 30.sp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: ()async{
              if(context.locale.languageCode!="en"){
                await context.setLocale(const Locale("en"));
                //navigateTo(const BNBScreen(),removeAll: true);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              decoration: BoxDecoration(
                  color: context.locale.languageCode=="en"?AppColors.mainColor:AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color:  context.locale.languageCode=="en"?AppColors.mainColor:AppColors.gery455,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: "English",
                    titleColor: context.locale.languageCode=="en"?AppColors.white:AppColors.gery455,
                    titleSize: 19.sp,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
