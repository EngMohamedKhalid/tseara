import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/custom_form_field.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/image_widget.dart';
import 'package:tseara/app/widgets/text_widget.dart';
import 'package:tseara/features/home_feature/presentation/widgets/custom_home_row_item.dart';
import 'package:tseara/features/notifications_feature/presentation/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Directionality(
       textDirection: TextDirection.rtl,
       child: ListView(
         padding: EdgeInsets.all(16.sp),
         children: [
           DefaultAppBarWidget(
             title: 'الرئيسية',
             centerTitle: true,
             leading: Icon(
               Icons.menu,
               size: 40.sp,
               color: AppColors.black,
             ),
             notify: false,
             actionsWidgets: [
               InkWell(
                 onTap:() {
                   navigateTo(NotificationsScreen());
                 },
                 child: Icon(
                   Icons.notifications,
                   size: 40.sp,
                   color: AppColors.mainColor,
                 ),
               ),
             ],

           ),
           30.verticalSpace,
           Row(
             children: [
               TextWidget(
                   title: "اهلا Sohaila Gaber !",
                   titleSize: 24.sp,
                   titleColor: AppColors.black,
                   titleFontWeight: FontWeight.w500

               ),
             ],
           ),
           16.verticalSpace,
           Row(
             children: [
               TextWidget(
                   title: "اعرف اسعار المنتجات من هنا",
                   titleSize: 18.sp,
                   titleFontWeight: FontWeight.w500

               ),
             ],
           ),
           20.verticalSpace,
           Row(
             children: [
               Expanded(
                 child: CustomFormField(
                   hint: 'ابحث',
                   align: TextAlign.start,
                   prefixIcon: Icons.search,
                 ),
               ),
               16.horizontalSpace,
               Icon(
                 Icons.keyboard_double_arrow_left,
                 size: 40.sp,
               )
             ],
           ),
           16.verticalSpace,
           CustomHomeRowItem(),
           30.verticalSpace,
           SizedBox(
             height: 200.h,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: 20,
               reverse: true,
               itemBuilder: (context, index) {
                 return Container(
                   padding: EdgeInsets.all(16.sp),
                   decoration: BoxDecoration(
                       color: AppColors.hint.withOpacity(.29),
                       borderRadius: BorderRadius.circular(20.r)
                   ),
                   child: Row(
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           16.verticalSpace,
                           TextWidget(
                             title: "حبوب و بقوليات",
                             titleSize: 18.sp,
                             titleFontWeight: FontWeight.w500,
                             titleColor: AppColors.black,
                           ),
                           8.verticalSpace,
                           TextWidget(
                             title: "سعر الحبوب والبقوليات",
                             titleSize: 15.sp,
                             titleFontWeight: FontWeight.w500,
                             titleColor: AppColors.black,
                           ),
                           Spacer(),
                           ButtonWidget(
                             text: "معرفة المزيد",
                             width: 200.w,
                             borderRadius: 50.r,
                           )
                         ],
                       ),
                       16.horizontalSpace,
                       ImageWidget(
                         imageUrl: "assets/images/cat.png",
                         width: 120.w,
                         height: 200.h,
                       ),
                     ],
                   ),
                 );
               },
               separatorBuilder: (context, index) => 16.horizontalSpace,
             ),
           ),
           30.verticalSpace,
           CustomHomeRowItem(
             name: "المنافذ",
           ),
           30.verticalSpace,
           SizedBox(
             height: 200.h,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: 20,
               reverse: true,
               itemBuilder: (context, index) {
                 return Container(
                   padding: EdgeInsets.all(16.sp),
                   decoration: BoxDecoration(
                       color: AppColors.hint.withOpacity(.29),
                       borderRadius: BorderRadius.circular(20.r)
                   ),
                   child: Row(
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           16.verticalSpace,
                           TextWidget(
                             title: "منافذ  هيئة التضامن الاجتماعي",
                             titleSize: 18.sp,
                             titleFontWeight: FontWeight.w500,
                             titleColor: AppColors.black,
                           ),
                           5.verticalSpace,
                           TextWidget(
                             title: "المنافذ التابعه لهيئة التضامن الاجتماعي",
                             titleSize: 15.sp,
                             titleFontWeight: FontWeight.w500,
                             titleColor: AppColors.black,
                           ),
                           Spacer(),
                           ButtonWidget(
                             text: "معرفة المزيد",
                             width: 200.w,
                             borderRadius: 50.r,
                           )
                         ],
                       ),
                       16.horizontalSpace,
                       ImageWidget(
                         imageUrl: "assets/images/egp.png",
                         width: 120.w,
                         height: 200.h,
                       ),
                     ],
                   ),
                 );
               },
               separatorBuilder: (context, index) => 16.horizontalSpace,
             ),
           )
         ],
       ),
     ),

    );
  }
}
