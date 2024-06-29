import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tseara/features/auth_feature/presentation/screens/choose_screen.dart';
import 'package:tseara/features/auth_feature/presentation/screens/login_screen.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../data/models/onboard_model.dart';
import '../widgets/custom_onboard_body.dart';
import 'get_started_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  List<OnBoardModel> onBoardModels = [
    OnBoardModel(
        image: "assets/images/onboard1.png",
        title1: "اعرف اسعار جميع المنتجات المصريه",
        title2: "جميع الاسعار هنا مراقبه من قبل الجهات الحكوميه ",
    ),
    OnBoardModel(
        image: "assets/images/onboard2.png",
        title1: "ارسل شكواك للجهات الحكوميه مباشرة",
        title2: "راسل الجهات الحكوميه وسيتم الرد علي شكواك خلال 24 ساعة ",
    ),
    OnBoardModel(
        image: "assets/images/onboard3.png",
        title1: "اعرف اماكن المنافذ  التابعه للدوله",
        title2: "اعرف جميع المنافذ التابعه للحكومه المصريه "
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
       Expanded(
           child: PageView.builder(
             controller: controller,
             itemCount: onBoardModels.length,
             itemBuilder:(context, index) {
               return CustomOnBoardBody(onBoardModel: onBoardModels[index]);
             },
             onPageChanged: (value) {
               setState(() {
                 currentIndex = value;
               });
             },
           ),
       ),
          30.verticalSpace,
          SmoothPageIndicator(
            controller: controller,
            count: onBoardModels.length,
            //models.length,
            effect: ExpandingDotsEffect(
                activeDotColor: AppColors.mainColor,
                dotColor: AppColors.geryB3B3B3,
                dotHeight: 10.h,
                dotWidth: 10.w,
            ),
          ),
          60.verticalSpace,
          ButtonWidget(
            horizontalMargin: 50.w,
            onPressed: () {
              if(currentIndex != 2){
                controller.jumpToPage(currentIndex + 1);
              }else{
                navigateTo(const ChooseScreen(),replace: true);
              }

            },
            text: "متابعه",
          ),
          16.verticalSpace,
          ButtonWidget(
            horizontalMargin: 50.w,
            onPressed: () {
              navigateTo(ChooseScreen(), replace: true);
            },
            color: AppColors.geryB3B3B3,
            textColor: AppColors.black,
            text: "تخطي",
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
