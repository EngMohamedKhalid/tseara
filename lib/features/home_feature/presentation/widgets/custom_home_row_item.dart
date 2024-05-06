import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/text_widget.dart';

class CustomHomeRowItem extends StatelessWidget {
  const CustomHomeRowItem({super.key, this.name, this.onTap});
 final String ? name;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          title: name?? "الاقسام",
          titleSize: 18.sp,
          titleColor: AppColors.black,
          titleFontWeight: FontWeight.bold,
          fontFamily: AppFonts.bold,
        ),
        Spacer(),
        InkWell(
          onTap: onTap??() {},
          child: TextWidget(
            title: "عرض الكل",
            titleSize: 17.sp,
            titleColor: AppColors.mainColor,
          ),
        ),
      ],
    );
  }
}
