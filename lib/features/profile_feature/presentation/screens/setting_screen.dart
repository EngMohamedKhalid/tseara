import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'package:tseara/features/profile_feature/presentation/screens/all_ports_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/favourit_product_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/profile_screen.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/list_tile_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../intro_feature/presentation/screens/splash_screen.dart';
import '../PLH/profile_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/profile_back.png"),
              fit: BoxFit.fill)),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get();
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                50.verticalSpace,
                Row(
                  children: [
                    ButtonWidget(
                      text: "تعديل الملف الشخصي",
                      textColor: AppColors.black,
                      color: AppColors.white,
                      textSize: 15.sp,
                      width: 150.w,
                      onPressed: () {
                        navigateTo(ProfileScreen());
                      },
                    ),
                  ],
                ),
                30.verticalSpace,
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2.w),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 100.sp,
                    color: Colors.white,
                  ),
                ),
                20.verticalSpace,
                TextWidget(
                  title: AuthCubit.get().userModel?.userName ?? "Rahma Atef",
                  titleSize: 20.sp,
                  fontFamily: AppFonts.bold,
                  titleColor: AppColors.white,
                  titleFontWeight: FontWeight.bold,
                ),
                10.verticalSpace,
                TextWidget(
                  title:
                      AuthCubit.get().userModel?.email ?? "rahmaAtef@gmail.com",
                  titleSize: 15.sp,
                  fontFamily: AppFonts.semiBold,
                  titleColor: AppColors.white,
                  titleFontWeight: AppFonts.bold600,
                ),
                80.verticalSpace,
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(AllPortsScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: AppColors.gery4.withOpacity(.09),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextWidget(
                                title: "المنافذ",
                                titleColor: AppColors.black,
                              ),
                              10.horizontalSpace,
                              Icon(Icons.fire_truck, size: 30.sp)
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          navigateTo(FavouriteProductScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: AppColors.gery4.withOpacity(.09),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextWidget(
                                title: "المنتجات المفضله",
                                titleColor: AppColors.black,
                              ),
                              10.horizontalSpace,
                              Icon(
                                  Icons.star_outline,
                                size: 30.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          globalAlertDialogue("Do you want to logout?",
                              cancelButtonText: "No",
                              okButtonText: "Yes", onOk: () {
                                getIt<CacheService>().clear().then((value) =>
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) => SplashScreen(),
                                    )));
                              }, onCancel: () {
                                Navigator.pop(context);
                              }, canCancel: true);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: AppColors.gery4.withOpacity(.09),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextWidget(
                                title: "تسجيل الخروج",
                                titleColor: AppColors.black,
                              ),
                              10.horizontalSpace,
                              Icon(Icons.logout_outlined, size: 30.sp,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                64.verticalSpace,
              ],
            ),
          );
        },
      ),
    ));
  }
}
/*
  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title: AuthCubit.get().userModel?.userName ?? "Rahma Atef",
                            titleSize: 16.sp,
                            fontFamily: AppFonts.bold,
                            titleColor: AppColors.black,
                            titleFontWeight: AppFonts.bold600,
                          ),
                          TextWidget(
                            title:  AuthCubit.get().userModel?.email ?? "rahmaAtef@gmail.com",
                            titleSize: 15.sp,
                            fontFamily: AppFonts.semiBold,
                            titleColor: AppColors.black,
                            titleFontWeight: AppFonts.bold600,
                          ),
                        ],
                      ),
 */
