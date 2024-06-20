import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/features/profile_feature/presentation/widgets/custom_fav_product_item.dart';

import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../categories_feature/presentation/widgets/custom_sub_category_product_item.dart';
import '../../../home_feature/presentation/PLH/home_cubit.dart';

class FavouriteProductScreen extends StatelessWidget {
  const FavouriteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          title: "منتجاتك المفضله",
          centerTitle: true,
          notify: false,
        ),
        body:
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get();
            return state is HomeFavLoaded
                ? Center(
              child: Loading(),
            )
                : cubit.getHomeFavouritesModel?.favoriteProducts?.length == 0
                    ? Center(
                  child: TextWidget(
                      title: "لا يوجد نتائج",
                      titleSize: 24.sp,
                      titleColor: AppColors.black,
                      titleFontWeight: FontWeight.w500),
                )
                    : GridView.builder(
              padding: EdgeInsets.all(16.sp),
                  itemCount: cubit.getHomeFavouritesModel?.favoriteProducts?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.58,
                  ),
                  itemBuilder: (context, index) {
                    return CustomFavProductItem(

                    );
                  },
                );
          },
        ),

      ),
    );
  }
}
