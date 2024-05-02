import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: DefaultAppBarWidget(
  title: 'Notifications',
  centerTitle: true,
   notify: false,
),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16.sp),
              margin: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 16.sp),
              decoration: BoxDecoration(
                color: AppColors.greyD8D8D8,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.notifications,
                    size: 40.sp,
                    color: AppColors.black,
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: TextWidget(
                      title: "Your Purchase Is Complete! please Check Your Email for Purchase Summary & Order Tracking!",
                      titleFontWeight: AppFonts.semiBold500,
                      fontFamily: AppFonts.semiBold,
                      titleSize: 13.sp,
                      titleColor: AppColors.black,
                      titleMaxLines: 50,
                      titleAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            );
          },
      )
    );
  }
}
