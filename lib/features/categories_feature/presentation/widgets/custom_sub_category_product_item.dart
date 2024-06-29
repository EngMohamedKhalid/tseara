import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/app/widgets/loading.dart';
import 'package:tseara/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:tseara/features/categories_feature/data/models/sub_category_model.dart';
import 'package:tseara/features/profile_feature/presentation/screens/add_report_screen.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../profile_feature/presentation/PLH/profile_cubit.dart';
class CustomSubCatProductItem extends StatefulWidget {
  const CustomSubCatProductItem({super.key, required this.products,  this.isFav=false});
final Products products;
final bool isFav;

  @override
  State<CustomSubCatProductItem> createState() => _CustomSubCatProductItemState();
}

class _CustomSubCatProductItemState extends State<CustomSubCatProductItem> {
  bool isFavorite = false;
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
                  getIt<CacheService>().getUserToken() == null?
                      0.verticalSpace:
                  InkWell(
                    onTap:widget.isFav? () {
                      print(widget.products.id);
                      setState(() {
                        isFavorite = true;
                      });
                      ProfileCubit.get().removeFromCart(productId: widget.products.id??0).then((value) {
                        setState(() {
                          isFavorite = false;
                        });
                       navigateTo(BNBScreen(),removeAll: true,);
                      });
                    }:
                        (){
                          print(widget.products.id);
                          setState(() {
                            isFavorite = true;
                          });
                          ProfileCubit.get().addToCart(productId: widget.products.id??0).then((value) {
                            setState(() {
                              isFavorite = false;
                            });
                          });
                        },
                    child:
                        isFavorite?
                        Loading()
                            :
                    Icon(
                      widget.isFav? Icons.star_rate:Icons.star_border,
                      color:widget.isFav? AppColors.mainColor: AppColors.gery4,
                      size: 30.sp,

                    ),
                  ),
                  20.horizontalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImageWidget(
                      imageUrl: widget.products.image??"assets/images/product.png",
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              TextWidget(
                title: widget.products.productName??"الجبن الابيض/كيلو",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              TextWidget(
                title: widget.products.isAvailable==true?"متوفر":"غير متوفر",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.w500,
              ),
              10.verticalSpace,
              TextWidget(
                title: "من${widget.products.priceFrom}:${widget.products.priceTo}جنيه",
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
          title: widget.products.lastUpdate??"تم التحديث في 14/12/2023",
          titleSize: 15.sp,
          titleColor: AppColors.gery455,
        ),
      ],
    );
  }
}
