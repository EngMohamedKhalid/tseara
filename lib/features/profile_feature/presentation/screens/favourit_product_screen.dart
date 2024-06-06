import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/features/profile_feature/presentation/widgets/custom_fav_product_item.dart';

import '../../../../app/widgets/text_widget.dart';

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
        body: GridView.builder(
          padding: EdgeInsets.all(16.sp),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return CustomFavProductItem();
            },
        )
      ),
    );
  }
}
