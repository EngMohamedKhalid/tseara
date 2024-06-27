import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/loading.dart';
import 'package:tseara/features/categories_feature/presentation/PLH/category_cubit.dart';
import 'package:tseara/features/categories_feature/presentation/screens/sub_category_screen.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,  this.isBNB = true});
  final bool isBNB;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          title: "الأقسام",
          notify: false,
          canBack:isBNB? false:true,
          centerTitle: true,
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            var cubit = CategoryCubit.get();
            return state is CategoryLoading
                ? Center(
                    child: Loading(),
                  )
                : Column(
                    children: [
                      24.verticalSpace,
                      Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                hint: 'ابحث',
                                align: TextAlign.start,
                                prefixIcon: Icons.search,
                                onChange: (value) {
                                  CategoryCubit.get()
                                      .searchCategory(searchKey: value);
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
                      ),
                      cubit.searchCategories?.length == 0
                          ? Center(
                              child: TextWidget(
                                  title: "لا يوجد نتائج",
                                  titleSize: 24.sp,
                                  titleColor: AppColors.black,
                                  titleFontWeight: FontWeight.w500),
                            )
                          : Expanded(
                              child: ListView.separated(
                                padding: EdgeInsets.all(16.sp),
                                itemCount: cubit.searchCategories?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      navigateTo(SubCategoryScreen(
                                          categoryId:cubit.searchCategories?[index].id??0,
                                        categoryTitle: cubit.searchCategories?[index].categoryName??"",
                                      ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12.sp),
                                      decoration: BoxDecoration(
                                          color: AppColors.hint.withOpacity(.29),
                                          borderRadius:BorderRadius.circular(20.r)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              //16.verticalSpace,
                                              TextWidget(
                                                title: cubit
                                                        .searchCategories?[
                                                            index]
                                                        .categoryName ??
                                                    "",
                                                titleSize: 18.sp,
                                                titleFontWeight:
                                                    FontWeight.bold,
                                                titleColor: AppColors.black,
                                              ),
                                              8.verticalSpace,
                                              TextWidget(
                                                title: "سعر${cubit.searchCategories?[index].categoryName ?? ""}",
                                                titleSize: 15.sp,
                                                titleFontWeight:
                                                    FontWeight.w500,
                                                titleColor: Colors.black45,
                                              ),
                                              32.verticalSpace,
                                              ButtonWidget(
                                                text: "معرفة المزيد",
                                                width: 200.w,
                                                color: AppColors.black,
                                                borderRadius: 50.r,
                                              )
                                            ],
                                          ),
                                          16.horizontalSpace,
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:BorderRadius.circular(20.r),
                                              child: ImageWidget(
                                                imageUrl: cubit
                                                        .searchCategories?[index]
                                                        .image ??
                                                    "assets/images/cat.png",
                                                width: 100.w,
                                                fit: BoxFit.fill,
                                                height: 150.h,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    16.verticalSpace,
                              ),
                            ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
