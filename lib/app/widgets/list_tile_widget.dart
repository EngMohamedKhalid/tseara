import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import 'image_widget.dart';
import 'text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final String title;
  final String imageUrl;
  final Color? tralingColor;
  final Color? textColor;
  final Color? iconColor;
  final bool arrowIcon;
  final bool image;
  final Widget ? trailing;
  final Widget ? leading;

  const ListTileWidget({
    super.key,
     this.onTap,
     this.icon,
    this.tralingColor,
    this.arrowIcon = true, required this.title, this.textColor, this.iconColor, this.image= false,  this.imageUrl="", this.trailing, this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: onTap,
        minLeadingWidth: 8.w,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
        dense: true,
        leading:image?
            ImageWidget(
                imageUrl: imageUrl,
              width: 21.w,
              height: 21.h,
              color: AppColors.mainColor,
            )
            :
        leading??Icon(
          icon,
          size: 26.sp,
          color:iconColor?? AppColors.mainColor,
        ),
        title: TextWidget(
          title: title,
          titleSize: 20.sp,
          fontFamily: AppFonts.semiBold,
          titleFontWeight: FontWeight.w500,
          titleColor:textColor?? AppColors.black,
          titleAlign: TextAlign.start,
        ),
        trailing:
            arrowIcon?
        trailing?? Icon(
          Icons.arrow_forward_ios,
          color:tralingColor?? AppColors.black,
          size: 16.sp,
        ):0.verticalSpace,

      ),
    );
  }
}
