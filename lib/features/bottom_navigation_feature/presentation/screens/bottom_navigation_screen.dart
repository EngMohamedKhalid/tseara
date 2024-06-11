import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/home_feature/presentation/PLH/home_cubit.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/image_widget.dart';
import '../presentation_logic_holder/bottom_navigation_cubit.dart';
import '../presentation_logic_holder/bottom_navigation_state.dart';
class BNBScreen extends StatefulWidget {
  const BNBScreen({super.key,  this.fromEng = false});
 final bool fromEng ;
  @override
  State<BNBScreen> createState() => _BNBScreenState();
}

class _BNBScreenState extends State<BNBScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BottomNavigationCubit, BottomNavigationStats>(
      builder: (context, state) {
        var cubit = BottomNavigationCubit.get(context);
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: AppColors.black,
            buttonBackgroundColor: AppColors.mainColor,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              ImageWidget(
                  imageUrl: "assets/images/Categorize.png",
                 color: Colors.white,
              ),
              ImageWidget(
                  imageUrl: "assets/images/report.png",
                 color: Colors.white,
              ),
              Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
            ],
            index: cubit.currentIndex,
            onTap: (index) {
             cubit.changeCurrent(index);
            },
          ),
          /*
          Container(
            height: 60.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
             color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: BottomNavigationBar(
                selectedItemColor: AppColors.mainColor,
                unselectedItemColor: AppColors.black,
                backgroundColor: AppColors.greyD8D8D8,
                elevation: 1,
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                selectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                onTap: (value) {
                  cubit.changeCurrent(value);
                },
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                  Icons.home,
                size: 22.sp,
              ),
                    label: "Home".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                  Icons.chat,
                size: 22.sp,
              ),
                    label: "Chat".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                  Icons.favorite,
                size: 22.sp,
              ),
                    label: "Favorites".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                  Icons.location_on,
                size: 22.sp,
              ),
                    label: "Locations".tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                  Icons.shopping_cart,
                size: 22.sp,
              ),
                    label: "Cart".tr(),
                  ),
                ],
              ),
            ),
          )
           */
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
