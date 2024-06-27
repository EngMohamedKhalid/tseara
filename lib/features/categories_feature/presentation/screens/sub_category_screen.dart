import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/custom_form_field.dart';
import 'package:tseara/app/widgets/text_widget.dart';
import 'package:tseara/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:tseara/features/categories_feature/presentation/PLH/category_cubit.dart';

import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../widgets/custom_sub_category_product_item.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen(
      {super.key, required this.categoryId, required this.categoryTitle,});

  final int categoryId;
  final String categoryTitle;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    super.initState();
    CategoryCubit.get().getSubCategory(id: widget.categoryId);
  }

  bool isFirst = true;
  String? selectedValue ;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          title: widget.categoryTitle,
          centerTitle: true,
          notify: false,
          onPop: () {
            navigateTo(BNBScreen(),removeAll: true,);
          },
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            var cubit = CategoryCubit.get();
            return Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: CustomFormField(
                  //         hint: 'ابحث',
                  //         align: TextAlign.start,
                  //         prefixIcon: Icons.search,
                  //         onChange: (value) {
                  //           //cubit.searchSubCategory(searchKey: value);
                  //         },
                  //       ),
                  //     ),
                  //     16.horizontalSpace,
                  //     Icon(
                  //       Icons.keyboard_double_arrow_left,
                  //       size: 40.sp,
                  //     )
                  //   ],
                  // ),
                  12.verticalSpace,
                  CustomFormField(
                    hint: 'ابحث',
                    align: TextAlign.start,
                    prefixIcon: Icons.search,
                    onChange: (value) {
                      CategoryCubit.get()
                          .searchSubCategory(searchKey: value);
                    },
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomDropDown(
                        width: 200,
                        height: 60.h,
                        items: cubit.titles??[""],
                        dropDownHint: selectedValue??"اختار منتج",
                        onItemChanged: (value) {
                          setState(() {
                            selectedValue = value;
                            if(value=="المنتجات الغذائيه" || value=="خضراوات "|| value=="الفاكهة "){
                              isFirst =true;
                            }else{
                              isFirst =false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      TextWidget(
                        title: selectedValue??"",
                        titleColor: AppColors.black,
                        titleSize: 20.sp,
                        titleFontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.underline,
                        decorationColor: AppColors.black,
                      )
                    ],
                  ),
                  16.verticalSpace,
                  state is CategoryLoading?
                  Center(child: Loading(),):
                      selectedValue!=null?
                  Expanded(
                    child:
                        isFirst?
                        cubit.subCategoriesSearch![0].products?.length==0?
                        Center(child: TextWidget(
                          title: "لا يوجد منتجات",
                          titleColor: AppColors.black,
                          titleSize: 20.sp,
                          titleFontWeight: FontWeight.bold,
                        ),):
                    GridView.builder(
                      itemCount: cubit.subCategoriesSearch?[0].products?.length??0,
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.5,
                        mainAxisSpacing: 20.sp,
                        crossAxisSpacing: 20.sp,
                      ),
                      itemBuilder: (context, index) {
                        return CustomSubCatProductItem(
                          products: cubit.subCategoriesSearch![0].products![index],
                        );
                      },
                    )
                            :
            cubit.subCategoriesSearch?[1].products?.length==0?
            Center(child: TextWidget(
              title: "لا يوجد منتجات",
              titleColor: AppColors.black,
              titleSize: 20.sp,
              titleFontWeight: FontWeight.bold,
            ),):
                        GridView.builder(
                          itemCount: cubit.subCategoriesSearch?[1].products?.length??0,
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.57,
                            mainAxisSpacing: 20.sp,
                            crossAxisSpacing: 20.sp,
                          ),
                          itemBuilder: (context, index) {
                            return CustomSubCatProductItem(
                              products: cubit.subCategoriesSearch![1].products![index],
                            );
                          },
                        ),
                  ):
                          Center(child: TextWidget(
                            title: "من فضلك اختار منتج",
                            titleColor: AppColors.black,
                            titleSize: 20.sp,
                            titleFontWeight: FontWeight.bold,
                          ),)

                ],
              ),
            );
          },
        ),


      ),
    );
  }
}
