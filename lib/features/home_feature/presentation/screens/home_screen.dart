import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/get_it_injection.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/custom_form_field.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/app/widgets/loading.dart';
import 'package:tseara/app/widgets/text_widget.dart';
import 'package:tseara/features/categories_feature/presentation/PLH/category_cubit.dart';
import 'package:tseara/features/home_feature/presentation/PLH/home_cubit.dart';
import 'package:tseara/features/home_feature/presentation/widgets/custom_home_row_item.dart';
import 'package:tseara/features/notifications_feature/presentation/screens/notifications_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/setting_screen.dart';

import '../../../../app/services/cache_service.dart';
import '../../../categories_feature/presentation/screens/sub_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          DefaultAppBarWidget(
            title: 'الرئيسية',
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                navigateTo(SettingScreen());
              },
              child: Icon(
                Icons.menu,
                size: 40.sp,
                color: AppColors.black,
              ),
            ),
            notify: false,
            actionsWidgets: [
              InkWell(
                onTap: () {
                  navigateTo(NotificationsScreen());
                },
                child: Icon(
                  Icons.notifications,
                  size: 40.sp,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          30.verticalSpace,
          Row(
            children: [
              TextWidget(
                  title:
                      "اهلا ${getIt<CacheService>().getUserData()?.userName ?? ""} !",
                  titleSize: 24.sp,
                  titleColor: AppColors.black,
                  titleFontWeight: FontWeight.w500),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              TextWidget(
                  title: "اعرف اسعار المنتجات من هنا",
                  titleSize: 18.sp,
                  titleFontWeight: FontWeight.w500),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomFormField(
                  hint: 'ابحث',
                  align: TextAlign.start,
                  prefixIcon: Icons.search,
                  onChange: (value) {
                    HomeCubit.get().searchPort(searchKey: value);
                    CategoryCubit.get().searchCategory(searchKey: value);
                  },
                ),
              ),
              16.horizontalSpace,
              Icon(
                Icons.keyboard_double_arrow_left,
                size: 40.sp,
              )
            ],
          ),
          16.verticalSpace,
          CustomHomeRowItem(),
          30.verticalSpace,
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              var cubit = CategoryCubit.get();
              return
                state is CategoryLoading? Center(child: Loading(),):
                SizedBox(
                height: 170.h,
                child: cubit.searchCategories?.length == 0
                    ? Center(
                        child: TextWidget(
                            title: "لا يوجد نتائج",
                            titleSize: 24.sp,
                            titleColor: AppColors.black,
                            titleFontWeight: FontWeight.w500),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.searchCategories?.length ?? 0,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              navigateTo(SubCategoryScreen(
                                  categoryTitle: cubit.searchCategories?[index].categoryName??"",
                                  categoryId:cubit.searchCategories?[index].id??0));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.hint.withOpacity(.29),
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      16.verticalSpace,
                                      TextWidget(
                                        title: cubit.searchCategories?[index]
                                                .categoryName ??
                                            "حبوب و بقوليات",
                                        titleSize: 18.sp,
                                        titleFontWeight: FontWeight.bold,
                                        titleColor: AppColors.black,
                                      ),
                                      ButtonWidget(
                                        text: "معرفة المزيد",
                                        width: 200.w,
                                        borderRadius: 50.r,
                                      )
                                    ],
                                  ),
                                  16.horizontalSpace,
                                  ClipRRect(
                                    borderRadius:BorderRadius.circular(20.r),
                                    child: ImageWidget(
                                      imageUrl: cubit.searchCategories?[index].image ?? "assets/images/cat.png",
                                      width: 150.w,
                                      fit: BoxFit.fill,
                                      height: 200.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            16.horizontalSpace,
                      ),
              );
            },
          ),
          30.verticalSpace,
          CustomHomeRowItem(
            name: "المنافذ",
          ),
          30.verticalSpace,
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get();
              return state is HomeLoading
                  ? Center(
                      child: Loading(),
                    )
                  : SizedBox(
                      height: 170.h,
                      child: cubit.searchPorts?.length == 0
                          ? Center(
                              child: TextWidget(
                                  title: "لا يوجد نتائج",
                                  titleSize: 24.sp,
                                  titleColor: AppColors.black,
                                  titleFontWeight: FontWeight.w500),
                            )
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.searchPorts?.length ?? 0,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(16.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.hint.withOpacity(.29),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          16.verticalSpace,
                                          TextWidget(
                                            title: cubit.searchPorts?[index]
                                                    .portName ??
                                                "منافذ  هيئة التضامن الاجتماعي",
                                            titleSize: 18.sp,
                                            titleFontWeight: FontWeight.bold,
                                            titleColor: AppColors.black,
                                          ),
                                          5.verticalSpace,
                                          TextWidget(
                                            title:
                                                "محافظة ${cubit.searchPorts?[index].governorate ?? ""}",
                                            titleSize: 15.sp,
                                            titleFontWeight: FontWeight.w600,
                                            titleColor: AppColors.black,
                                          ),
                                          Spacer(),
                                          ButtonWidget(
                                            text: "معرفة المزيد",
                                            width: 200.w,
                                            borderRadius: 50.r,
                                          )
                                        ],
                                      ),
                                      16.horizontalSpace,
                                      ImageWidget(
                                        imageUrl: "assets/images/egp.png",
                                        width: 120.w,
                                        height: 200.h,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  16.horizontalSpace,
                            ),
                    );
            },
          )
        ],
      ),
    ));
  }
}
