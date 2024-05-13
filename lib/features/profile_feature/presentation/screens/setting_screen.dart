import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'package:tseara/features/profile_feature/presentation/screens/policy_screen.dart';
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
import 'lang_screen.dart';

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
      appBar: DefaultAppBarWidget(
        title: 'Settings',
        centerTitle: true,
        notify: false,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get();
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              InkWell(
                onTap: () {
                  navigateTo(ProfileScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.greyD8D8D8,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("http://graduation2024.first-meeting.net/Uploads/Users/defultuser.png",),
                            )
                        ),
                      ),
                      5.horizontalSpace,
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
                      Spacer(),
                      Icon(
                        Icons.edit,
                        size: 24.sp,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.greyD8D8D8,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    ListTileWidget(
                      title: "Notifications",
                      leading: Icon(
                        Icons.notifications,
                      ),
                      trailing: Switch(
                        value: isNotification,
                        thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                              (Set<MaterialState> states) {
                            if (isNotification) {
                              return Icon(
                                color: AppColors.white,Icons.check,size: 20.sp,
                              );
                            }
                            else {
                              return const Icon(Icons.close,color: AppColors.black,);
                            }
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            isNotification = value;
                          });
                        },
                      ),
                    ),
                    16.verticalSpace,
                    ListTileWidget(
                      title: "Language",
                      onTap: () {
                        navigateTo(LanguageScreen());
                      },
                      leading: Icon(
                        Icons.translate,
                      ),
                    ),
                    16.verticalSpace,
                    ListTileWidget(
                      title: "Privacy",
                      onTap: () {
                        navigateTo(PolicyScreen());
                      },
                      leading: Icon(
                        Icons.privacy_tip_outlined,
                      ),
                    ),
                    16.verticalSpace,
                    ListTileWidget(
                      title: "Log out",
                      onTap: () {
                        globalAlertDialogue(
                            "Do you want to logout?",
                            cancelButtonText: "No",
                            okButtonText: "Yes",
                            onOk: () {
                              getIt<CacheService>().clear().then((value) =>
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => SplashScreen(),
                                      )
                                  ));
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            canCancel: true
                        );
                      },
                      leading: Icon(
                        Icons.logout,
                        color: AppColors.red,
                      ),
                      arrowIcon: false,
                    ),
                  ],
                ),
              ),
              64.verticalSpace,
              ButtonWidget(
                text: "THANK YOU FOR CHOOSING US",
                textColor: AppColors.white,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalPadding: 20.h,
                height: 80.h,
                borderRadius: 24.r,

              )
            ],
          );
        },
      ),


    );
  }
}
