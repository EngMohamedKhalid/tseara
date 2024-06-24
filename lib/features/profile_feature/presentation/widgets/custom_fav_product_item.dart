import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/app/widgets/loading.dart';
import 'package:tseara/features/categories_feature/data/models/sub_category_model.dart';
import 'package:tseara/features/profile_feature/presentation/PLH/profile_cubit.dart';
import 'package:tseara/features/profile_feature/presentation/screens/add_report_screen.dart';
import 'package:tseara/features/profile_feature/presentation/screens/favourit_product_screen.dart';

import '../../../../app/widgets/text_widget.dart';
import '../../../home_feature/presentation/PLH/home_cubit.dart';
class CustomFavProductItem extends StatefulWidget {
  const CustomFavProductItem({super.key, required this.product});
  final Products product;

  @override
  State<CustomFavProductItem> createState() => _CustomFavProductItemState();
}

class _CustomFavProductItemState extends State<CustomFavProductItem> {
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
                  InkWell(
                    onTap: () {
                      print(widget.product.id);
                      setState(() {
                        isFavorite = true;
                      });
                      ProfileCubit.get().removeFromCart(productId: widget.product.id??0).then((value) {
                        setState(() {
                          isFavorite = false;
                        });
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return FavouriteProductScreen();
                          },)
                        );
                      });
                    },
                    child:
                        isFavorite?
                            Loading()
                        :
                    Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 30.sp,

                    ),
                  ),
                  16.horizontalSpace,
                  ImageWidget(
                    imageUrl:widget.product.image?? "assets/images/product.png",
                    width: 90.w,
                    height: 90.h,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              16.verticalSpace,
              TextWidget(
                title:widget.product.productName?? "الجبن الابيض/كيلو",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              TextWidget(
                title: widget.product.isAvailable==true? "متوفر":"غير متوفر",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.w500,
              ),
              10.verticalSpace,
              TextWidget(
                title:"من${widget.product.priceFrom}:${widget.product.priceTo}جنيه",
                titleSize: 18.sp,
                titleColor: AppColors.black,
                titleFontWeight: FontWeight.bold,
              ),
              10.verticalSpace,
              ButtonWidget(
                text: "أرسل شكوي",
                width: 200.w,
                onPressed: () {
                  navigateTo(AddReportScreen(isBNB: false,));
                },
              ),
            ],
          ),
        ),
        TextWidget(
          title:widget.product.lastUpdate??  "تم التحديث في 14/12/2023",
          titleSize: 15.sp,
          titleColor: AppColors.gery455,
        ),
      ],
    );
  }
}
