import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/features/categories_feature/data/models/sub_category_model.dart';
import 'package:tseara/features/profile_feature/presentation/screens/add_report_screen.dart';

import '../../../../app/widgets/text_widget.dart';
class CustomSubCatProductItem extends StatelessWidget {
  const CustomSubCatProductItem({super.key, required this.products,  this.isFav=false});
final Products products;
final bool isFav;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xffECECEC),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isFav? Icons.star_rate:Icons.star_border,
                    color:isFav? AppColors.mainColor: AppColors.gery4,
                    size: 30.sp,

                  ),
                  20.horizontalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImageWidget(
                      imageUrl: products.image??"assets/images/product.png",
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              TextWidget(
                title: products.productName??"الجبن الابيض/كيلو",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              TextWidget(
                title: products.isAvailable==true?"متوفر":"غير متوفر",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.w500,
              ),
              10.verticalSpace,
              TextWidget(
                title: "من${products.priceFrom}:${products.priceTo}جنيه",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              10.verticalSpace,
              ButtonWidget(
                onPressed: () {
                  navigateTo(
                    AddReportScreen(isBNB: false,)
                  );
                },
                text: "أرسل شكوي",
                width: 200.w,
              ),
            ],
          ),
        ),
        TextWidget(
          title: products.lastUpdate??"تم التحديث في 14/12/2023",
          titleSize: 15.sp,
          titleColor: AppColors.gery455,
        ),
      ],
    );
  }
}
